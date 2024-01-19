<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="utf-8">
</head>

<body>
    <p>
        Dear {{$user->name}},</p>
    <p>
        Please click the button below to confirm your email address.
    </p>

    <a href="{{ $actionUrl }}" class="button" style="display: inline-block; padding: 10px 20px; font-size: 16px; text-align: center; text-decoration: none; color: #ffffff; background-color: #007BFF; border-radius: 5px; cursor: pointer;">{{$actionText}}</a>

    <p>If you didn't create an account, you can ignore this message.</p>

    <p>
        Best regards,<br>
        {{ config('app.name')}}
    </p>

    <p>
        <hr>
        <span class="break-all">
            <strong>If you're having trouble clicking the button, copy and paste the following URL into your web browser:</strong><br />
            <em>{{$actionUrl}}</em>
        </span>
    </p>

</body>

</html>
