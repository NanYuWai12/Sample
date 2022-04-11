<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="px-5 pt-3">
  <div class="row">
    <div class="col-12 col-sm-6">
      <h4 class="mb-0">User List</h4>
    </div>
    <c:if test="${not empty infoMsg}">
      <div class="col-12 offset-sm-2 col-sm-4">
        <div class="alert alert-success alert-dismissible py-0 mb-0">
          <a href="#" class="close px-3 py-0" data-dismiss="alert"
            aria-label="close">&times;</a> <strong>${infoMsg}</strong>
        </div>
      </div>
      <c:remove var="infoMsg" />
    </c:if>
    <c:if test="${not empty errMsg}">
      <div class="col-12 offset-sm-2 col-sm-4">
        <div class="alert alert-warning alert-dismissible py-0 mb-0">
          <a href="#" class="close px-3 py-0" data-dismiss="alert"
            aria-label="close">&times;</a> <strong>${errMsg}</strong>
        </div>
      </div>
      <c:remove var="errMsg" />
    </c:if>
  </div>
  <hr />
  <div class="row m-0 py-2">
    <form:form action="${contextPath}/userList"
      modelAttribute="searchUserForm" method="post"
      class="col-12 col-sm-10 p-0">
      <div class="row m-0">
        <form:input type="text" path="name" placeholder="Name"
          class="form-control col-12 col-sm-2 mr-sm-3 mb-2 mb-sm-0 d-inline-block" />
        <form:input type="text" path="email" placeholder="Email"
          class="form-control col-12 col-sm-2 mr-sm-3 mb-2 mb-sm-0 d-inline-block" />
        <form:input type="text" path="fromDate" placeholder="Form Date"
          class="form-control col-12 col-sm-2 mr-sm-3 mb-2 mb-sm-0 d-inline datepicker" />
        <form:input type="text" path="toDate" placeholder="To Date"
          class="form-control col-12 col-sm-2 mr-sm-3 mb-2 mb-sm-0 d-inline datepicker" />
        <button type="submit" class="btn btn-outline-info w-150px">
          <i class="fas fa-search"></i> Search
        </button>
      </div>
    </form:form>
    <div class="col-12 col-sm-2 p-0 text-right">
      <a class="btn btn-outline-info w-150px" href="userRegister"> <i
        class="fas fa-plus"></i> Register
      </a>
    </div>
  </div>
  <div class="table-responsive mt-4">
    <table
      class="table table-sm table-striped table-bordered tbl-user-list">
      <thead>
        <tr class="text-center">
          <th>Name</th>
          <th>Email</th>
          <th>Created User</th>
          <th>Phone</th>
          <th>Birth Date</th>
          <th>Address</th>
          <th>Created Date</th>
          <th>Updated Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${userList}" var="user" varStatus="loop">
          <tr>
            <td><a title="Detail"
              href="<c:url value="/userDetail?id=${user.id}"/>">${user.name}</a></td>
            <td>${user.email}</td>
            <td>${user.createdUserName}</td>
            <td>${user.phone}</td>
            <td class="text-center"><fmt:formatDate
                value="${user.dob}" pattern="dd/MM/yyyy" /></td>
            <td>${user.address}</td>
            <td class="text-center"><fmt:formatDate
                value="${user.createdAt}" pattern="dd/MM/yyyy" /></td>
            <td class="text-center"><fmt:formatDate
                value="${user.updatedAt}" pattern="dd/MM/yyyy" /></td>
            <td class="text-center"><a class="text-info"
              href="${contextPath}/userUpdate?id=${user.id}"
              title="Edit"><i class="fas fa-user-edit"></i></a> <a
              class="text-danger ml-4" href="#" title="Delete"
              data-toggle="modal" data-target="#userDeleteModal"
              data-whatever="${user.id}"><i class="fas fa-user-times"></i></a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<div class="modal fade" tabindex="-1" role="dialog"
  data-backdrop="static" id="userDeleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4>Delete User</h4>
      </div>
      <div class="modal-body text-center">
        <i class="fas fa-trash-alt fa-3x text-danger my-2"></i>
        <p>Are you sure you want to delete this user?</p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-sm btn-outline-info" data-dismiss="modal">Cancel</button>
        <form:form action="${contextPath}/userDelete" method="post">
          <input type="hidden" name="id" id="userId">
          <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
        </form:form>
      </div>
    </div>
  </div>
</div>