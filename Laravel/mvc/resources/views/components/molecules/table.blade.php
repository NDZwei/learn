<table class="table table-striped">
    <thead class="thead-dark">
        <tr>
            @foreach($columns as $column)
                <th>{{ $column }}</th>
            @endforeach
            @if(!empty($actions))
                <th>Actions</th>
            @endif
        </tr>
    </thead>
    <tbody>
        @foreach ($contents as $content)
            <tr>
                @foreach($columns as $column)
                    @if(strpos($column, '.') !== false)
                        @php
                            [$object, $field] = explode('.', $column, 2);
                        @endphp
                        <td>{{ data_get($content->$object, $field) }}</td>
                    @else
                        <td>{{ data_get($content, $column) }}</td>
                    @endif
                @endforeach
                @if(!empty($actions))
                    <td>
                        @foreach($actions as $action)
                            <a href="{{ route($action['route'], [$content->id]) }}" class="btn btn-{{ $action['class'] }}">
                                <i class="{{ $action['icon'] }}"></i>
                            </a>
                        @endforeach
                    </td>
                @endif
            </tr>
        @endforeach
    </tbody>
</table>
