
<!--menu -->
<div class="section main-menu" id="menu">
    <div class="container">
        <div class="main-menu-bg">
            <h3 class="w3layouts-title text-center">our menu</h3>
            <div class="menu-info">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <?php $active='active' ?>
                    @foreach($categories as $category)
                        <li role="presentation" class="{{$active}}">
                            <a href="#{{strtolower(str_replace(' ','-',$category->category_name))}}" aria-controls="{{strtolower(str_replace(' ','-',$category->category_name))}}" role="tab" data-toggle="tab">{{$category->category_name}}</a>
                        </li>
                    <?php $active='' ?>
                    @endforeach
                </ul>
            </div>
            <!-- Tab panes -->
            <div class="tab-content">
                <?php $active='active' ?>
            @foreach($categories as $category)
                <div role="tabpanel" class="tab-pane {{$active}}" id="{{strtolower(str_replace(' ','-',$category->category_name))}}">
                    @foreach($category->menuItems as $item)
                    <div class="col-md-4 agileinfo-tab-content1">
                        <div class="menu-text-right1">
                            <div class="menu-title">
                                <h4>{{$item->item_name}}</h4>
                            </div>
                            <div class="menu-price">
                                <h4 class="price-clr">{{setting('site.currency').' '.$item->price}}</h4>
                            </div>
                            <div class="clearfix"></div>
                            <p id="pfont"> {{$item->description}}</p>
                            <form class="add-to-cart" action="{{route('addToOrder')}}" method="post">
                                @csrf
                                <button class="btn btn-warning center-block">Add to Order</button>
                                <input type="hidden" value="{{$item->food_menu_item_id}}" name="foodId">
                            </form>
                        </div>
                    </div>
                        <?php $active='' ?>
                    @endforeach
                    <div class="clearfix"></div>
                </div>

              @endforeach
            </div>
        </div>
    </div>
</div>
<!--menu-->

<div class="menu-agileits_w3layouts section">
    <div class="container">
        <div class="load_more">
            <h3 class="w3layouts-title">
                <img src="frontend/image-assets/menu1.png" class="img-responsive" alt="">special dishes</h3>
            @if(count($featured) > 0)
            <ul {{--id="myList"--}}>
                @foreach($featured as $feature)
                    <div class="l_g">
                        <div class="l_g_r">
                            <div class="col-md-6 menu-grids">
                                <div class="w3l-menu-text">
                                    <div class="menu-text-left">
                                        <img src="storage/{{($feature->image)}}" alt="" class="img-responsive">
                                    </div>
                                    <div class="menu-text-right">
                                        <div class="menu-title">
                                            <h3>{{$feature->item_name}} </h3>
                                        </div>
                                        <div class="menu-price">
                                            <h4 class="price-clr">{{setting('site.currency').' '.$feature->price}}</h4>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p id="pfont"> {{$feature->description}}</p>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </ul>
               {{-- <div class="nav-menu text-center">
                    <div id="loadMore">Load more</div>
                    <div id="showLess">Show less</div>
                </div>--}}
            @else
                 <h1 class="text-center">No Special Dishes</h1>
            @endif
        </div>
    </div>
</div>
<!--//menu-->

{{--@push('scripts')
    <script>
        $(document).ready(function () {
            size_li = $("#myList li").size();
            x = 1;
            $('#myList li:lt(' + x + ')').show();
            $('#loadMore').click(function () {
                x = (x + 1 <= size_li) ? x + 1 : size_li;
                $('#myList li:lt(' + x + ')').show();
                $(".load_more").addClass('increaseHeight');
            });
            $('#showLess').click(function () {
                x = (x - 1 < 0) ? 1 : x - 1;
                $('#myList li').not(':lt(' + x + ')').hide();
                $(".load_more").removeClass('increaseHeight');
            });
        });
    </script>
@endpush--}}


