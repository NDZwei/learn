@include('components.layout.header')
<form action="/products/" method="POST">
    @csrf
    <label for="code">Code:</label>
    <input type="text" id="code" name="code" value="{{ isset($product) ? $product->code : null }}" {{ $readonly ? 'readonly' : '' }}>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="{{ isset($product) ? $product->name : null }}" {{ $readonly ? 'readonly' : '' }}>

    <label for="category_id">Category:</label>
    <x-molecules.select-input
        name="category_id"
        id="category_id"
        :options="$categories"
        :fieldColumn="'name'"
        placeholder="Choose a category"
        :selected="$product->category_id ?? null"
    />

    @unless($readonly)
        <button type="submit">Save</button>
    @endunless
</form>

@include('components.layout.footer')
