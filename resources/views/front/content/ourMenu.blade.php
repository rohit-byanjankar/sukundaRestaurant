
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
                            <p> {{$item->description}}</p>
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
            <ul id="myList">
                <?php
                    $count=count($featured);
                    $pages=ceil($count/6);
                    $display='list-item';

                    for ($i=0;$i<$pages;$i++)
                        {
                ?>
                <li style="display:{{$display}}">
                    <div class="l_g">
                        <div class="l_g_r">
                            @for($j=$i*6; $j<count($featured); $j++)
                                @php
                                $feature=$featured[$j];
                                @endphp
                            <div class="col-md-6 menu-grids">
                                <div class="w3l-menu-text">
                                    <div class="menu-text-left">
                                        <img src="{{$feature->image}}" alt="" class="img-responsive">
                                    </div>
                                    <div class="menu-text-right">
                                        <div class="menu-title">
                                            <h4>{{$feature->item_name}} </h4>

                                        </div>
                                        <div class="menu-price">
                                            <h4 class="price-clr">{{setting('site.currency').' '.$feature->price}}</h4>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p> {{$feature->description}}</p>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                                <?php
                                    if($j>=5+(6*$i))break;
                                ?>
                            @endfor
                        </div>
                    </div>
                </li>
                    <?php
                        $display='none';
                        } ?>
            </ul>
            <div class="nav-menu text-center">
                <div id="loadMore">Load more</div>
                <div id="showLess">Show less</div>
            </div>
        </div>
    </div>
</div>
<!--//menu-->

@push('scripts')
    <script>
        $(document).ready(function () {
            size_li = $("#myList li").size();
            x = 1;
            $('#myList li:lt(' + x + ')').show();
            $('#loadMore').click(function () {
                x = (x + 1 <= size_li) ? x + 1 : size_li;
                $('#myList li:lt(' + x + ')').show();
            });
            $('#showLess').click(function () {
                x = (x - 1 < 0) ? 1 : x - 1;
                $('#myList li').not(':lt(' + x + ')').hide();
            });
        });
    </script>
@endpush


