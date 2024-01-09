@props(['type' => 'text', 'name', 'value' => null])

<input type="{{ $type }}" name="{{ $name }}" @if($value !== null) value="{{ $value }}" @endif {{ $attributes }}>