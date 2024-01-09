<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Table extends Component
{
    public $pageIndex;
    public $pageSize;
    public $columns;
    public $contents;
    public $totalElements;
    public $totalPages;
    public $sort;

    public function __construct($pageIndex = null, $pageSize = null, $columns = null, $contents = null, $totalElements = null, $totalPages = null, $sort = null)
    {
        $this->pageIndex = $pageIndex;
        $this->pageSize = $pageSize;
        $this->columns = $columns;
        $this->contents = $contents;
        $this->totalElements = $totalElements;
        $this->totalPages = $totalPages;
        $this->sort = $sort;
    }


    public function render()
    {
        return view('components.table');
    }
}
