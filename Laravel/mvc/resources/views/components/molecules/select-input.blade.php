@props(['options', 'name', 'id', 'placeholder', 'fieldColumn', 'selected'])

<select name="{{ $name }}" id="{{ $id }}" class="js-autocomplete">
    @if ($placeholder)
        <option value="" selected disabled>{{ $placeholder }}</option>
    @endif
    @foreach($options as $option)
        <option value="{{ $option['id'] }}" {{ $selected == $option['id'] ? 'selected' : '' }}>
            {{ $option[$fieldColumn] }}
        </option>
    @endforeach
</select>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        $('.js-autocomplete').select2({
            placeholder: "{{ $placeholder ?: 'Select an option' }}",
            allowClear: true,
        });
    });
</script>
