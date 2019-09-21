@extends('errors.minimal')

@section('title', __('Unauthorized'))
@section('code', '401')
@section('message', __('User does not have valid authentication credentials for the target resource.'))
