@extends('voyager::master')

@section('content')

<div class="container">
    <h4>
        Recipe Name : {{$recipe->recipe_name}}
    </h4>
</div>
<div class="col-md-12">
    <table id="recipe_detail" class="col-md-12">
        <thead>
            <tr>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($recipe_details as $recipe_detail)
            <tr>
                <td>{{$recipe_detail->item_name}}</td>
                <td>{{$recipe_detail->quantity}} {{$recipe_detail->measuring_unit}}</td>
                <td>
                    <a onclick="return confirm('Are you sure?')" href="{{route('recipeDetail.delete',$recipe_detail->recipe_detail_id)}}" title="Delete" class="btn btn-sm btn-danger pull-right delete">
                        <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
                    </a>

                    <a href="{{ route('recipeDetail.edit', $recipe_detail->recipe_detail_id)}}" title="Edit" class="btn btn-sm btn-primary pull-right edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
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
        $('#recipe_detail').DataTable();
    });
</script>
@stop