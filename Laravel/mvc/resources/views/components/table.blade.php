<table>
    <thead>
        <tr>
            @foreach($columns as $column)
                <th>{{ $column }}</th>
            @endforeach
        </tr>
    </thead>
    <tbody>
        @foreach ($contents as $content)
            <tr>
                @foreach($columns as $column)
                    <td>{{ $content->$column }}</td>
                @endforeach
            </tr>
        @endforeach
    </tbody>
</table>