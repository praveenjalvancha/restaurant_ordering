require 'test_helper'

class DineTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dine_table = dine_tables(:one)
  end

  test "should get index" do
    get dine_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_dine_table_url
    assert_response :success
  end

  test "should create dine_table" do
    assert_difference('DineTable.count') do
      post dine_tables_url, params: { dine_table: { status: @dine_table.status, table_number: @dine_table.table_number } }
    end

    assert_redirected_to dine_table_url(DineTable.last)
  end

  test "should show dine_table" do
    get dine_table_url(@dine_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_dine_table_url(@dine_table)
    assert_response :success
  end

  test "should update dine_table" do
    patch dine_table_url(@dine_table), params: { dine_table: { status: @dine_table.status, table_number: @dine_table.table_number } }
    assert_redirected_to dine_table_url(@dine_table)
  end

  test "should destroy dine_table" do
    assert_difference('DineTable.count', -1) do
      delete dine_table_url(@dine_table)
    end

    assert_redirected_to dine_tables_url
  end
end
