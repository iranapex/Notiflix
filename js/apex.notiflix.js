var beCtbNotiflix = {};

beCtbNotiflix.util = {
    replaceItems: function (pMsg) {
      var item;
      var itemOnPage;
      var items = new RegExp("#\\w+#", "g");
      var replacedMsg = pMsg;
  
      while (item = items.exec(pMsg)) {
          itemOnPage = $x(item[0].replace(/#/g, ""));
          if (itemOnPage) {
              replacedMsg = replacedMsg.replace(item[0], $v(itemOnPage));
          }
      }
      return replacedMsg;
    }
  };

beCtbNotiflix.Notify = {
    util: beCtbNotiflix.util,
  
    Success: function (pThis) {
        Notiflix.Notify.Success(this.util.replaceItems(pThis.action.attribute03), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      });
    },
    Failure: function (pThis) {
        Notiflix.Notify.Failure(this.util.replaceItems(pThis.action.attribute03), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      });
    },
    Warning: function (pThis) {
        Notiflix.Notify.Warning(this.util.replaceItems(pThis.action.attribute03), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      });
    },
    Info: function (pThis) {
        Notiflix.Notify.Info(this.util.replaceItems(pThis.action.attribute03), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      },
      {
        rtl: true,
      });
    }
  };

  beCtbNotiflix.Report = {
    util: beCtbNotiflix.util,
  
    Success: function (pThis) {
         Notiflix.Report.Success( this.util.replaceItems(pThis.action.attribute03), this.util.replaceItems(pThis.action.attribute04), this.util.replaceItems(pThis.action.attribute13), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      }); 
    },
    Failure: function (pThis) {
         Notiflix.Report.Failure( this.util.replaceItems(pThis.action.attribute03), this.util.replaceItems(pThis.action.attribute04), this.util.replaceItems(pThis.action.attribute13), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      }); 
    },
    Warning: function (pThis) {
         Notiflix.Report.Warning( this.util.replaceItems(pThis.action.attribute03), this.util.replaceItems(pThis.action.attribute04), this.util.replaceItems(pThis.action.attribute13), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      }); 
    },
    Info: function (pThis) {
         Notiflix.Report.Info( this.util.replaceItems(pThis.action.attribute03), this.util.replaceItems(pThis.action.attribute04), this.util.replaceItems(pThis.action.attribute13), function (e) {
        apex.da.resume(pThis.resumeCallback, false);
      }); 
    }
  };

  beCtbNotiflix.Confirm = {
    util: beCtbNotiflix.util,
  
    Show: function (pThis) {
         Notiflix.Confirm.Show( this.util.replaceItems(pThis.action.attribute03), this.util.replaceItems(pThis.action.attribute04), this.util.replaceItems(pThis.action.attribute13), this.util.replaceItems(pThis.action.attribute14), function(){ apex.da.resume(pThis.resumeCallback, false); }, function(){ ; } ); 
    }
   };
