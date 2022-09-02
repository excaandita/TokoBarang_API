<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BarangController;
use App\Http\Controllers\API\TransactionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/user', [AuthController::class , 'fetch']);
        Route::post('/logout', [AuthController::class, 'logout']);

        Route::get('/barang', [BarangController::class, 'index']);
        Route::post('/barang/add', [BarangController::class, 'store']);
        Route::post('/barang/{id}/edit', [BarangController::class, 'update']);
        Route::delete('barang/{id}', [BarangController::class, 'delete']); 
        
        Route::get('/transactions', [TransactionController::class, 'index']);
        Route::get('/transactions/date', [TransactionController::class, 'filterDate']);
        Route::delete('/transactions/delete', [TransactionController::class, 'delete']);
        Route::post('/checkout', [TransactionController::class, 'checkout']);

    });

