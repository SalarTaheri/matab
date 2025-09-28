<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page contentType="text/html;charset=UTF-8" %>


<script type="text/template" id="p_page">
    <form class="p-myform uk-panel uk-panel-box uk-form uk-form-horizontal" data-title="{{=it.title}}" id="{{=it.uid}}"
          dir="ltr">
        <h3 class="cf-title uk-panel-title">{{=it.index}}. {{=it.title}}</h3>

        <div class="p-qs">
            {{=it.content}}
        </div>

    </form>
</script>

<script type="text/template" id="p_question_wrapper">
    <div class="uk-form-row">
        <label class="p-q-label uk-form-label" for="{{=it.uid}}">
            <span class="p-q-index">{{=it.index}}.</span> {{=it.title}}
        </label>
        {{=it.content}}
        {{ if(it.ifYesQuestion && it.ifYesQuestion.content){ }}
        <div class="p-q-ifYesQuestion" data-yes="{{=it.ifYesQuestion.yes  }}">
            {{=it.ifYesQuestion.content}}
        </div>
        {{ } }}
    </div>
</script>

<script type="text/template" id="p_type_group">
    <div class="p-q-group uk-form-controls uk-form-controls-text">
        {{=it.content}}
    </div>
</script>

<script type="text/template" id="p_type_unknown">
    <input type="text" class="p-q-input uk-form-controls uk-form-danger" placeholder="{{=it.type}}" id="{{=it.uid}}"
           disabled/>
</script>

<script type="text/template" id="p_type_text">
    <input type="text" class="p-q-input uk-form-controls" name="{{=it.uid}}" id="{{=it.uid}}"
           style="width: {{=it.width}}; height: {{=it.height}}"/>
</script>

<script type="text/template" id="p_type_number">
    <input type="number" class="p-q-input uk-form-controls" name="{{=it.uid}}" id="{{=it.uid}}"/>
</script>

<script type="text/template" id="p_type_date">
    <input type="text" class="p-q-input uk-form-controls" role="datepicker" lang="fa" name="{{=it.uid}}"
           id="{{=it.uid}}"/>
</script>

<script type="text/template" id="p_type_checkbox">
    <input type="checkbox" class="p-q-input uk-form-controls" name="{{=it.uid}}" id="{{=it.uid}}"/>
</script>

<script type="text/template" id="p_type_textarea">
    <%--<textarea class="p-q-input uk-form-controls" name="{{=it.uid}}" id="{{=it.uid}}"  cols="{{=it.cols}}" rows="{{=it.rows}}" dir="{{=it.dir}}" />--%>
    <textarea class="p-q-input uk-form-controls" name="{{=it.uid}}" id="{{=it.uid}}" cols="{{=it.cols}}"
              rows="{{=it.rows}}" dir="{{=it.dir}}" style="width: {{=it.width}}; height: {{=it.height}}"/>
</script>

<script type="text/template" id="p_type_yesno">
    <div class="p-q-radio uk-form-controls">
        <label class="p-q-label uk-form-label" style="width:50px">No <input type="radio" class="p-q-radio"
                                                                            name="{{=it.uid}}" value="no"/></label>
        <label class="p-q-label uk-form-label" style="width:50px">Yes <input type="radio" class="p-q-radio"
                                                                             name="{{=it.uid}}" value="yes"/></label>
    </div>
</script>

<script type="text/template" id="p_type_yesnoif">
    <div class="p-q-radio uk-form-controls">
        <label class="p-q-label uk-form-label" style="width:50px">No <input type="radio" class="p-q-radio p-q-yesnoif"
                                                                            name="{{=it.uid}}" value="no"/></label>
        <label class="p-q-label uk-form-label" style="width:50px">Yes <input type="radio" class="p-q-radio p-q-yesnoif"
                                                                             name="{{=it.uid}}" value="yes"/></label>

        <div style="display:none;" id="div_{{=it.uid}}_ifyes">
            <label class="p-q-label uk-form-label" for="{{=it.uid}}_ifyes">{{=it.ifYes || "" }}</label>
            <input type="text" class="p-q-input" name="{{=it.uid}}_ifyes" id="{{=it.uid}}_ifyes"/>
        </div>
    </div>
</script>

<script type="text/template" id="p_type_checkboxes">
    <div class="p-q-group uk-form-controls uk-form-controls-text">
        {{ for(var i=0; i
        <it.options.length
        ; i++) { var option = it.options[i], title = option.title || option, myid = it.uid +"_"+ title.replace(/\s/g,
        "_"); }}
        <label class="p-q-label uk-form-label" for="{{=myid }}">
            <span class="p-q-subIndex">{{=(i + 1)}}.</span> {{=title}}
            <input type="checkbox" class="p-q-checkbox" name="{{=myid }}" id="{{=myid }}"/>
        </label>
        {{ } }}
    </div>
</script>

<script type="text/template" id="p_type_radio">
    <div class="p-q-options uk-form-controls uk-form-controls-radio">
        {{ for(var i=0; i
        <it.options.length
        ; i++) { var option = it.options[i], title = option.title || option, myid = it.uid +"_"+ title.replace(/\s/g,
        "_"); }}
        <label class="p-q-label p-q-radio-label uk-form-label" for="{{=myid }}">
            <span class="p-q-subIndex">{{=(i + 1)}}.</span> {{=title}}
            <input type="radio" class="p-q-checkbox" name="{{=it.uid }}" id="{{=myid }}" value="{{=title}}"/>
        </label>
        {{ } }}
    </div>
</script>

<script type="text/template" id="p_type_selectbox">
    {{ var multiple = (it.multiple) ? "multiple='multiple'" : ""; }}
    <select name="{{=it.uid }}" id="{{=it.uid }}" class="p-q-select p-q-select-chosen " {{=multiple }}
    data-max="{{=it.max}} " >
    <option value=""></option>
    {{ for(var i=0; i
    <it.options.length
    ; i++) { var option = it.options[i], title = option.title || option, myid = it.uid +"_"+ title.replace(/\s/g, "_");
    }}
    <option value="{{=title}}" id="{{=myid }}"><span class="p-q-subIndex">{{=(i + 1)}}.</span> {{=title}}</option>
    {{ } }}
    </select>
</script>

<script type="text/template" id="p_type_simple_matrix">
    <table class="uk-table uk-table-striped uk-table-hover">
        <thead>
        <th></th>
        {{ for(var i=0; i
        <it.cols.length
        ; i++) { }}
        {{ col = it.cols[i]; }}
        <th>{{=col}}</th>
        {{ } }}
        </thead>
        <tbody>
        {{ for(var j=0; j
        <it.rows.length
        ; j++) { }}
        {{ row = it.rows[j]; }}
        <tr>
            <td>{{=row}}</td>
            {{ for(var i=0; i
            <it.cols.length
            ; i++) { }}
            {{ col = it.cols[i]; }}
            <td>{{=it.getContentWithFixedName(j, i)}}</td>
            {{ } }}
        </tr>
        {{ } }}
        </tbody>
    </table>
</script>

<script type="text/template" id="p_type_tabular">
    <table class="uk-table uk-table-striped uk-table-hover">
        <thead>
        <th></th>
        {{ for(var i=0; i
        <it.cols.length
        ; i++) { }}
        {{ col = it.cols[i]; }}
        <th>{{=(col.title || col)}}</th>
        {{ } }}
        </thead>
        <tbody>
        {{ for(var j=0; j
        <it.rows
        ; j++) { }}
        <tr>
            <td>{{=j + 1}}</td>
            {{ for(var i=0; i
            <it.cols.length
            ; i++) { }}
            <td align="center">
                {{ if(it.cols[i].content){ }}
                {{=it.cols[i].getContentWithFixedName(j, i)}}
                {{ }else{ }}
                <input type="number" data-type="p_type_tabular" style="width:100px" class="p-q-input"
                       name="{{=it.uid}}_{{=j}}_{{=i}}" id="{{=it.uid}}_{{=j}}_{{=i}}"/>
                {{ } }}
            </td>
            {{ } }}
        </tr>
        {{ } }}
        </tbody>
    </table>
</script>
