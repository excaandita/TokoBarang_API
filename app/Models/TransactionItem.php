<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'users_id',
        'barangs_id',
        'transactions_id',
        'quantity',
        'total_price_item',
    ];

    public function barang() 
    {
        return $this->hasOne(Barang::class, 'id', 'barangs_id');
    }
}
