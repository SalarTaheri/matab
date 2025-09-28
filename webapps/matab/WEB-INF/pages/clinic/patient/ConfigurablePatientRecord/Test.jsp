<iframe id="cframe"  height="100%" width="100%"   ></iframe>
<script type="text/javascript">
    $(document).ready(function () {
//        if( window.location.href.indexOf('/null')>-1){

            var srcStringFrame=window.location.href;
            srcStringFrame=srcStringFrame+'/ConfigurablePatientRecordView';
            document.getElementById('cframe').src=srcStringFrame;
//        }else{

//        }
    })

</script>
