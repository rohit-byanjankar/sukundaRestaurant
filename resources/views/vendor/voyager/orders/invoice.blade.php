<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>{{$order->order_id}}</title>
    <link rel="stylesheet" href="style.css" media="all" />
</head>

<body>
    <header>
        <div class="top-container">
            <div class="logo">
                <img src="../public/dummy-logo.jpg">
            </div>
            <div class="company-info">
                <h2>KhajaGhar Pvt. Ltd.</h2>
                <div>Chyasal-9, Lalitur, Nepal</div>
                <div>01-430298</div>
                <div><a href="mailto:info@khajaghar.com">info@khajaghar.com</a></div>
            </div>
        </div>
        <div class="low-container">
            <div class="client">

                <div>Order No. :{{$order->order_id}}</div>
                <div>Invoice To: {{$order->customer_name}}</div>

            </div>
            <div class="invoice">
                <div>Invoice No. : 123</div>
                <div>Date of Invoice: 01/06/2014</div>
            </div>
        </div>
    </header>
    <main>
        <table border="0" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>S.N.</th>
                    <th>PARTICULAR</th>
                    <th>QTY</th>
                    <th>RATE</th>
                    <th>AMOUNT</th>
                </tr>
            </thead>
            <tbody>
                @foreach($order_lines as $order_line)
                <tr>
                    {{$index = 1}}
                    <td>{{$index++}}</td>
                    <td>{{$order_line->particular}}</td>
                    <td>{{$order_line->quantity}}</td>
                    <td>{{setting('site.currency')}} {{$order_line->rate}}</td>
                    <td>{{setting('site.currency')}} {{$order_line->amonut}}</td>
                </tr>
                @endforeach
                <tr>
                    <td colspan="4">Sub Total</td>
                    <td>$5,200.00</td>
                </tr>
                <tr>
                    <td colspan="4">Tax 13%</td>
                    <td>$130.00</td>
                </tr>
                <tr>
                    <td colspan="4">Grand Total</td>
                    <td>$6,000.00</td>
                </tr>
            </tbody>
        </table>
    </main>
    <footer>
        This is a test invoice!!!
    </footer>
</body>

</html>

<style>
    .top-container {
        width: 100%;
        height: 200px;
    }

    .low-container {
        width: 100%;
        height: 100px;
    }

    .logo,
    .client {
        float: left;
        width: 20%;
    }

    .logo>img {
        width: 100%;
        height: 60%;
    }

    .company-info {
        float: left;
        width: 60%;
        text-align: center;
    }

    .invoice {
        float: right;
        width: 65%;
        text-align: right;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        text-align: right;
        padding: 8px;
    }

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
    footer {
        color: #777777;
        width: 100%;
        height: 30px;
        position: absolute;
        bottom: 0;
        border-top: 1px solid #AAAAAA;
        padding: 8px 0;
        text-align: center;
    }
</style>