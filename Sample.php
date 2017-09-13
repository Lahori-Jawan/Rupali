<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use Carbon\Carbon;
use App\Notifications\UserIdExpired;
use App\Events\IdExpired;

class FindExpiredId extends Command
{
	/**
     * The name and signature of the console command.
     *
     * @var string
     */
	protected $signature = 'check:expiry';
	
	/**
     * The console command description.
     *
     * @var string
     */
	
	protected $description = 'Laravel Command to find expired Id(s) of Users';
	
	/**
     * Create a new command instance.
     *
     * @return void
     */
	
	public function __construct()
	{
		parent::__construct();	
	}
	/**
     * Execute the console command.
     *
     * @return mixed
	 */
	 
	public function handle()
	{
		$ZERO = 0;
		$MONTH = 30;
		$today = Carbon::today();
		$users = User::all();
		
		foreach($users as $user){

			$expiryDate = $user->qidexpire_on;
			
			if($today->diffInDays($expiryDate, false) <= $MONTH && $today->diffInDays($expiryDate, false) >= $ZERO){
				$user->notify(new UserIdExpired());
			}
			else {
				if($today->gte($expiryDate)){	
					// 	found already expired
					$this->info($expiryDate->diffForHumans());					
				}
			}
		}
	}
}

