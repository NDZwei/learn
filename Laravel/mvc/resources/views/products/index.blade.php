@include('components.layout.header')
    <div class="container mt-5">
        <h1>Product List</h1>
        <x-atoms.action-link
            href="products/create"
            class="btn btn-green"
        > Create product
        </x-atoms.action-link>

        <label for="category_id">Category</label>
        <x-molecules.select-input
            name="category_id"
            id="category_id"
            :options="$categories"
            :fieldColumn="'name'"
            placeholder="Choose a category"
            :selected="null"
        />

        <x-molecules.table
            :columns="[
                'category.name',
                'code',
                'name',
                'quantity',
                'price',
                'expiry_date',
            ]"
            :contents="$pagedData['contents']"
            :actions="[
                ['route' => 'products.show', 'class' => 'btn-info', 'icon' => 'fa-solid fa-magnifying-glass'],
                ['route' => 'products.edit', 'class' => 'btn-primary', 'icon' => 'fa-regular fa-pen-to-square'],
            ]"
        />
    </div>
@include('components.layout.footer')

