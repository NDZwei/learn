<?php

namespace App\Mail;

use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Auth;

class UserVerify extends VerifyEmail implements ShouldQueue {
    use Queueable;
    public $user;

    public function __construct($user = '')
    {
        $this->user = $user ?: Auth::user();
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        $actionUrl = $this->verificationUrl($notifiable);
        $actionText = 'Click here';
        return (new MailMessage)->subject('Verify your account')->view('emails.user-verify',
            [
                'user' => $this->user,
                'actionText' => $actionText,
                'actionUrl' => $actionUrl,
            ]
        );
    }
}
