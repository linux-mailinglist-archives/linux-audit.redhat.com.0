Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B81C117CAF9
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 03:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583548329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5YvKIbb5fdzcRg3XBIAvKQRMaRkaNdybybOHbSe0pHU=;
	b=TKZvU2UcE2iqrsmmSkonirtMJyxYCqsvB7fLPZkaNKFeat/Lyi0VvFrmHng5HyPGYh27qo
	aMF5QrUzkUBXCMZfPKGP1DBTZWYW3wQ8F4YH9klBuGXl1gaP7M7SR0QUU14JNs0HchE0Xo
	j3WHbatODCz43V4STDk1jlpPzGRo13o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-UtaKsOZMNAa1A3mmNz1GLQ-1; Fri, 06 Mar 2020 21:32:07 -0500
X-MC-Unique: UtaKsOZMNAa1A3mmNz1GLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 056FB800D53;
	Sat,  7 Mar 2020 02:32:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2D98AC45;
	Sat,  7 Mar 2020 02:32:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 198FD84481;
	Sat,  7 Mar 2020 02:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0272VnPD017018 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 21:31:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BBE912022EA5; Sat,  7 Mar 2020 02:31:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6FBF2026D68
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:31:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6C98007AC
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:31:47 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-84-SbISoAcOOhqP2LCzTyg8kg-1; Fri, 06 Mar 2020 21:31:44 -0500
X-MC-Unique: SbISoAcOOhqP2LCzTyg8kg-1
Received: by mail-ed1-f67.google.com with SMTP id m25so4772180edq.8
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 18:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=64EvP1pT7B1uhF91j79RNrnsWnOcEOYc8XujllSJgbM=;
	b=F0yZc76qGEBvcIVec9m+fjlYs4Iez1JgPMEHNNXJrZlCSVg54hb0aEglcfmhQ0gkUe
	bxgwEKq18lTl2+cGjJlxK3uJ256TYizWMvyPEQUhbvzrPTQ8g5CtuOQbm/35xwA7Bnw/
	/50us1uKJBwBk2MJ81xi9lkDhW5RwdGhvldEvfgpbw3UPly2tXiXxWZ5hE+eLRSt9ijA
	AAyOVZxddjnIcr7gBtOg1Tsy9qts6LgWey8upLJN4A3m6//I0mG022sTyuqTK+rpcaxR
	sihC6ae4a/QuxK49P8Kj1j75lpoZjo1v2gZfx1IY8+fKV7Jnf5NwCkTfLdCRhkeneUEY
	YeXw==
X-Gm-Message-State: ANhLgQ0ooWAK1rqdOiBOen7XcXoq8oFBeMw06Z0ehP4YffC27xTPWVQv
	4/kAGGZKACcierbt+b2nYZytBBvXZqVfSmRI/n0a
X-Google-Smtp-Source: ADFU+vuNmXM7kRV5tQ4h2jCNr8NhaRgF8kB7wCVcSVj3yrA1pazMC1EJWDiaximajNd+ddPVO2+DEf6w/7ms74V02Ek=
X-Received: by 2002:a50:e108:: with SMTP id h8mr5996766edl.196.1583548303498; 
	Fri, 06 Mar 2020 18:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-14-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-14-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 21:31:32 -0500
Message-ID: <CAHC9VhSrjdzL_4s1kPvuc6PxOQi5LmsxRaW10pYjDM2_nbstJw@mail.gmail.com>
Subject: Re: [PATCH v15 21/23] Audit: Include object data for all security
	modules
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0272VnPD017018
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> When there is more than one context displaying security
> module extend what goes into the audit record by supplimenting
> the "obj=" with an "obj_<lsm>=" for each such security
> module.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc:linux-audit@redhat.com
> ---
>  kernel/audit.h   |   4 +-
>  kernel/auditsc.c | 106 ++++++++++++++++++++++++-----------------------
>  2 files changed, 56 insertions(+), 54 deletions(-)

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 68ae5fa843c1..7dab48661e31 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -956,13 +953,57 @@ static inline void audit_free_context(struct audit_context *context)
>         kfree(context);
>  }
>
> +static int audit_log_object_context(struct audit_buffer *ab,
> +                                   struct lsmblob *blob)
> +{
> +       struct lsmcontext context;
> +       const char *lsm;
> +       int i;
> +
> +       /*
> +        * None of the installed modules have object labels.
> +        */
> +       if (security_lsm_slot_name(0) == NULL)
> +               return 0;
> +
> +       if (blob->secid[0] != 0) {
> +               if (security_secid_to_secctx(blob, &context, 0)) {
> +                       audit_log_format(ab, " obj=?");
> +                       return 1;
> +               }
> +               audit_log_format(ab, " obj=%s", context.context);
> +               security_release_secctx(&context);
> +       }
> +
> +       /*
> +        * Don't do anything more unless there is more than one LSM
> +        * with a security context to report.
> +        */
> +       if (security_lsm_slot_name(1) == NULL)
> +               return 0;
> +
> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> +               lsm = security_lsm_slot_name(i);
> +               if (lsm == NULL)
> +                       break;
> +               if (blob->secid[i] == 0)
> +                       continue;
> +               if (security_secid_to_secctx(blob, &context, i)) {
> +                       audit_log_format(ab, " obj_%s=?", lsm);
> +                       continue;
> +               }
> +               audit_log_format(ab, " obj_%s=%s", lsm, context.context);
> +               security_release_secctx(&context);
> +       }
> +       return 0;
> +}
> +
>  static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>                                  kuid_t auid, kuid_t uid,
>                                  unsigned int sessionid,
>                                  struct lsmblob *blob, char *comm)
>  {
>         struct audit_buffer *ab;
> -       struct lsmcontext lsmctx;
>         int rc = 0;
>
>         ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
> @@ -972,15 +1013,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>         audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
>                          from_kuid(&init_user_ns, auid),
>                          from_kuid(&init_user_ns, uid), sessionid);
> -       if (lsmblob_is_set(blob)) {
> -               if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
> -                       audit_log_format(ab, " obj=(none)");
> -                       rc = 1;
> -               } else {
> -                       audit_log_format(ab, " obj=%s", lsmctx.context);
> -                       security_release_secctx(&lsmctx);
> -               }
> -       }
> +       rc = audit_log_object_context(ab, blob);
>         audit_log_format(ab, " ocomm=");
>         audit_log_untrustedstring(ab, comm);
>         audit_log_end(ab);

I realized you don't hang around linux-audit (why would anyone want to
do that?!) so let me tell you one of my most hated mantras: "new audit
fields MUST go at the end of the audit record".  The "MUST" is in all
caps because either I'm being clever and reusing some IETF RFC
concepts, or I'm tired of arguing this point and feel like
capitalization is the best I can do for stress relief; maybe it is a
combination of the two.  Feel free to pick whichever reason you find
most pleasing.

Either way, the "obj=" field should stay where it is, but the
"obj_XXX=" fields need to find their way to the end of the record.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

