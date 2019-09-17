@extends('voyager::master')

@section('content')

<div class="card card-default">
    <div class="card-body">
        <div class="content">
            <form action="{{isset($recipe) ? route('recipe.update',$recipe->recipe_id) : route('recipe.store')}}" method="post">
                @csrf
                @if(isset($recipe))
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Recipe Id</label>
                        <input type="number" name="recipe_id" class="form-control" readonly value="{{$recipe->recipe_id}}">
                    </div>
                </div>
                @endif

                <div class="col-md-12">
                    <div class="form-group">
                        <label>Recipe Name</label>
                        <input type="text" name="recipe_name" class="form-control" value="{{isset($recipe) ? $recipe->recipe_name : ''}}" required>
                    </div>
                </div>

                <div class="col-md-12">
                    <table class="table table-bordered col-md-12" id="item_table">
                        <thead>
                            <tr style="width:100%">
                                <th style="width: 20%">Item Name</th>
                                <th style="width: 10%">Quantity</th>
                                <th style="width: 10%">Measuring Unit</th>
                                <th style="width: 20%"><button type="button" name="add" class="btn btn-success btn-sm add"><span class="glyphicon glyphicon-plus"></span></button></th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(isset($recipeDetails))
                            @foreach($recipeDetails as $recipeDetail)
                            <tr>
                                <td class='col-md-4'>
                                    <select class="form-control" name="item_id[]">
                                        @for($i = 0; $i < sizeof($items);$i++) 
                                        <option value="{{$items[$i]->item_id}}" <?php if ($items[$i]->item_id == $recipeDetail->item_id) echo "selected"; ?>>{{$items[$i]->item_name}}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td class='col-md-2'>
                                    <input type='number' class='form-control quantity' name='quantity[]' value="{{$recipeDetail->quantity}}" min=1 required />
                                </td>
                                <td class='col-md-2'>
                                    <select class="form-control" name="measuring_unit[]">
                                        @for($i = 0; $i < sizeof($measuring_units);$i++) <option value="{{$measuring_units[$i]->name}}" <?php if ($measuring_units[$i]->name == $recipeDetail->measuring_unit) echo "selected"; ?>>{{$measuring_units[$i]->name}}</option>
                                            @endfor
                                    </select>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you sure?')" name='remove' class='btn btn-danger btn-sm remove' href="{{route('recipeDetail.delete',$recipeDetail->recipe_detail_id)}}" style="text-decoration: none">
                                        <span class='glyphicon glyphicon-minus'></span>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td class='col-md-6'>
                                    <select name="item_id[]" class="form-control" required>
                                        @foreach($items as $item)
                                        <option value="{{$item->item_id}}">{{$item->item_name}}</option>
                                        @endforeach
                                    </select>
                                </td>
                                <td class='col-md-2'><input type='number' class='form-control quantity' name='quantity[]' min=1 required value=1 /></td>
                                <td class='col-md-2'>
                                    <select name="measuring_unit[]" class="form-control" required>
                                        @foreach($measuring_units as $measuring_unit)
                                        <option value="{{$measuring_unit->name}}" class="form-control">{{$measuring_unit->name}}</option>
                                        @endforeach
                                    </select>
                                </td>
                                <td><button type='button' name='remove' class='btn btn-danger btn-sm remove' min=0><span class='glyphicon glyphicon-minus'></span></button></td>
                            </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success">
                        {{ isset($recipe) ? 'UPDATE RECIPE' : 'CREATE RECIPE' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@stop

@section('javascript')

<script>
    count = 1;
    $(document).on('click', '.add', function() {
        var html = '';
        html += '<tr>';
        html += "<td class='col-md-6'><select name=\"item_id[]\" class=\"form-control selectTo\" " +
            "@foreach($items as $item)" +
            "<option value=\"{{$item->item_id}}\" class=\"form-control\">{{$item->item_name}}</option>" +
            "@endforeach" +
            "</select></td>";
        html += "<td class='col-md-2'><input type='number' class='form-control quantity' name = 'quantity[]' min=1 required value=1 /></td>";
        html += "<td class='col-md-2'><select name=\"measuring_unit[]\" class=\"form-control\" required>" +
            "@foreach($measuring_units as $measuring_unit)" +
            "<option value=\"{{$measuring_unit->name}}\" class=\"form-control\">{{$measuring_unit->name}}</option>" +
            "@endforeach" +
            "</select></td>";
        html += "<td><button type='button' name='remove' class='btn btn-danger btn-sm remove' min=0 ><span class='glyphicon glyphicon-minus'></span></button></td></tr>";
        $('#item_table').append(html);
        count++;
    });
    $(document).on('click', '.remove', function() {
        count = count - 1;
        $(this).closest('tr').remove();
    });

</script>
@stop