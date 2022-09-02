<?php

namespace App\Http\Controllers\API;

use App\Models\Barang;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Models\TransactionItem;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Support\Facades\Auth;
use PhpParser\Node\Stmt\TryCatch;

class TransactionController extends Controller
{
    public function index(Request $request)
    {
        $id = $request->input('id');
        $transCode = $request->input('code');

        if($id)
        {
            $transaction = Transaction::with(['items.barang'])->find($id);

            if($transaction)
            {
                return ResponseFormatter::success(
                    $transaction,
                    'Data Transaksi berhasil diambil'
                );
            }
            else
            {
                return ResponseFormatter::error(
                    null,
                    'Data Transaksi tidak ada',
                    404
                );
            }
        }
        $transaction = Transaction::with(['items.barang']);

        if($transCode)
        {
            $transaction->where('code', 'like', '%'. $transCode .'%');
        }

        return ResponseFormatter::success([
            $transaction->paginate(5),
            'Data List Berhasil di tampilkan'
        ], 'success');
    }

    public function checkout(Request $request) 
    {
        try {
            $request->validate([
                'items' => 'required|array',
                'items.*.id' => 'exists:barangs,id',
            ]);
    
            $code = 'TB-'.mt_rand(00000,99999);
            $price = 0;
            $transaction = Transaction::create([
                'users_id' => Auth::user()->id,
                'buyer_name' => $request->buyer_name,
                'address' => $request->address,
                'phone_number' => $request->phone_number,
                'code' => $code,
            ]);
            
            foreach ($request->items as $barang) {
                
                $barangDetail = Barang::where('id', $barang['id'])->first();
                TransactionItem::create([
                    'users_id' => Auth::user()->id,
                    'barangs_id' => $barang['id'],
                    'transactions_id' => $transaction->id,
                    'quantity' => $barang['quantity'],
                    'total_price_item' => $barangDetail->barang_price * $barang['quantity'],
    
                ]);
    
                $price += $barangDetail->barang_price * $barang['quantity'];
            }
    
            $transaction->update([
                'total_price' => $price,
            ]);
            
            return ResponseFormatter::success(
                $transaction->load('items.barang'),
                'Transaksi Berhasil',
            );
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something Went Wrong',
                'error' => $error,
            ], 'Not Found');
        }
    }

    public function filterDate(Request $request)
    {
        $start_date = date('Y-m-d',strtotime($request->input('start_date')));
        $end_date = date('Y-m-d',strtotime($request->input('end_date')));

        $data = Transaction::whereDate('created_at','>=',$start_date)->whereDate('created_at','<=',$end_date);

        if($data)
            {
                return ResponseFormatter::success(
                    $data->paginate(5),
                    'Data Transaksi berhasil diambil'
                );
            }
            else
            {
                return ResponseFormatter::error(
                    null,
                    'Data Transaksi tidak ada',
                    404
                );
            }
    }

    public function delete(Request $request)
    {
        $transaction = Transaction::where('code', $request->input('code'))->first();
        
        if(!$transaction) {
            return ResponseFormatter::error([
                'message' => 'Kode Transaksi Tidak Ada',
                'error' => 'Error',
            ],'Something Went Wrong');
        } 
        
        $transItem = TransactionItem::where('transactions_id', $transaction->id)->get();
        if (!$transItem) {
            $transaction->delete();
            return ResponseFormatter::success([
                'message' => 'Transaksi Berhasil Dihapus',
            ]);
        }

        foreach($transItem as $item) {
            $item->delete();
        }

        $transaction->delete();

        return ResponseFormatter::success([
            'message' => 'Barang Berhasil di Hapus',           
        ]);


        
    }
}
