@extends('voyager::master')

@section('content')

<div class="card card-default">
    <div class="card-body">
        <div class="content">
            <form action="{{route('recipeDetail.update',$recipe_detail->recipe_detail_id)}}" method="post">
                @csrf
                <input type="hidden" name ="recipe_id" value="{{$recipe_detail->recipe_id}}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                        <label>Item Name</label>
                            <select class="form-control" name="item_id">
                                @for($i = 0; $i < sizeof($items);$i++) <option value="{{$items[$i]->item_id}}" <?php if ($items[$i]->item_id == $recipe_detail->item_id) echo "selected"; ?>>{{$items[$i]->item_name}}</option>
                                    @endfor
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="number" name="quantity" value="{{$recipe_detail->quantity}}" class="form-control" required>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <select class="form-control" name="measuring_unit">
                                @for($i = 0; $i < sizeof($measuring_units);$i++) <option value="{{$measuring_units[$i]->name}}" <?php if ($measuring_units[$i]->name == $recipe_detail->measuring_unit) echo "selected"; ?>>{{$measuring_units[$i]->name}}</option>
                                    @endfor
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>
@stop