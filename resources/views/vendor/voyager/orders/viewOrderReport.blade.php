<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Report</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h3 class="text-center">Order Report From {{$orderFrom}} To {{$orderTo}}</h3>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Order Number </th>
            <th>Food Item</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        @foreach($orders as $order)
        <tbody>
        <tr>
            <td>{{$order->order_id}}</td>
            <td>{{$order->particular}}</td>
            <td>{{$order->Total}}</td>
            <td>Rs.{{$order->Total * $order->rate}} </td>
        </tr>
        </tbody>
        @endforeach
    </table>
</div>
</body>
</html>
