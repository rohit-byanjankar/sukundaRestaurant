@extends('voyager::master')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-list"></i> inBill
    </h1>
    <a href="{{ route('recipe.create') }}" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
    </a>
</div>
@stop

@section('content')

<div class="col-md-12">
    <table id="recipe">
        <thead>
            <th>Recipe Id</th>
            <th>Recipe Name</th>
            <th>Action</th>
        </thead>
        <tbody>
            @foreach($recipes as $recipe)
            <tr>
                <td>{{$recipe->recipe_id}}</td>
                <td>{{$recipe->recipe_name}}</td>
                <td>
                    <a href="{{route('recipe.show',$recipe->recipe_id)}}" title="View" class="btn btn-sm btn-warning pull-left view">
                        <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                    </a>
                    <a href="{{route('recipe.edit',$recipe->recipe_id)}}" title="Edit" class="btn btn-sm btn-primary pull-left edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
                    </a>
                    <a href="{{route('recipe.delete',$recipe->recipe_id)}}" onclick="return confirm('Are you sure?')" title="Delete" class="btn btn-sm btn-danger pull-left delete">
                        <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
                    </a>

                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@stop

@section('javascript')
<script>
    $(document).ready(function() {
        $('#recipe').DataTable();
    });
</script>
@stop