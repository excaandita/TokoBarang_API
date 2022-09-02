<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\Barang;
use Illuminate\Http\Request;
use GuzzleHttp\Psr7\Response;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Http\Resources\BarangResource;
use Symfony\Component\HttpKernel\Event\RequestEvent;

class BarangController extends Controller
{
    public function index(Request $request) 
    {
        $id = $request->input('id');
        $name = $request->input('barang_name');
        $price = $request->input('barang_price');
        $limit = 5;

        if($id)
        {
            $barang = Barang::all()->find($id);

            if($barang) {
                return ResponseFormatter::success(
                    $barang,
                    'Data Produk Berhasil diambil'
                );
            }
            else {
                return ResponseFormatter::error(
                    null,
                    'Data Produk Tidak Ada',
                    404
                );
            }
        }
        
        $barang = Barang::orderBy('id', 'DESC');

        if($name){
            $barang->where('barang_name', 'like', '%' . $name . '%');
        }
        if($price){
            $barang->where('barang_price', 'like', '%' . $price . '%');
        }

        return ResponseFormatter::success([
            $barang->paginate(5),
            'Data Produk Berhasil di Ambil',
        ], 'success');
    }

    public function store(Request $request) 
    {   
        try {
            $request->validate([
                'barang_name' => ['required', 'max:255', 'string', 'unique:barangs'],
                'barang_price' => ['required', 'integer'],
            ]);
    
            Barang::create([
                'barang_name' => $request->barang_name,
                'barang_price' => $request->barang_price,
            ]);
        
            $barang = Barang::where('barang_name', $request->barang_name)->first();

            return ResponseFormatter::success([
                $barang,
                'Data Berhasil Di Tambahkan',
            ]);
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something Went Wrong',
                'error' => $error,
            ]);
        }
    }

    public function update(Request $request, $id)
    {
        $barang = Barang::where('id', $id)->first();

        if(!$barang) {
            return ResponseFormatter::error([
                'message' => 'Something Went Wrong',
            ]);
        }

        try {
            $request->validate([
                'barang_name' => ['required', 'max:255', 'string'],
                'barang_price' => ['required', 'integer'],
            ]);
    
            $barang->update([
                'barang_name' => $request->barang_name ?? $barang->barang_name,
                'barang_price' => $request->barang_price ?? $barang->barang_price,
            ]);
        
            $barang = Barang::where('id', $id)->first();

            return ResponseFormatter::success([
                $barang,
                'Data Berhasil Di Update',
            ]);
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something Went Wrong',
                'error' => $error,
            ]);
        }
    }

    public function delete($id)
    {
        $barang = Barang::where('id', $id)->first();

        if(!$barang) {
            return ResponseFormatter::error([
                'message' => 'Something Went Wrong',
                'error' => 'Error',
            ]);
        }

        $barang->delete();

        return ResponseFormatter::success([
            'message' => 'Barang Berhasil di Hapus',           
        ]);
    }
}
