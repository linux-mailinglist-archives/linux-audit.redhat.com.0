Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C66DF17ED79
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 01:56:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583801760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z3UkH1MgcErJeBcQZCPvw9ENx2q84p4rNzQJ6iCPHNE=;
	b=DaQF5rGi9ZkgZs9blNFi5XPhRttnxfO5An47s7YfPimnLRt9XweaO/CNU8VrIYgpUTv6FD
	5lrRnByvD0EGqUETiCgEER2GuYL1V7nSg63pmcUn/7I7bsRR23LVygp8cbiTvZeTqkxciM
	kAaoY9kDk3RyCfw9GcayFMuf7mszpng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-WKXGNA_APGKTeqJFwGRMyA-1; Mon, 09 Mar 2020 20:55:58 -0400
X-MC-Unique: WKXGNA_APGKTeqJFwGRMyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8EA413EA;
	Tue, 10 Mar 2020 00:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C80228B75C;
	Tue, 10 Mar 2020 00:55:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 031E41809567;
	Tue, 10 Mar 2020 00:55:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02A0tYDG003825 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 20:55:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1DAB10F8E09; Tue, 10 Mar 2020 00:55:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3FC10F8E08
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 00:55:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA3DC185A78E
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 00:55:32 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-134-VMLCa6DRN-uIEZu03gFXaw-1; Mon, 09 Mar 2020 20:55:30 -0400
X-MC-Unique: VMLCa6DRN-uIEZu03gFXaw-1
Received: by mail-ed1-f67.google.com with SMTP id h62so14215023edd.12
	for <linux-audit@redhat.com>; Mon, 09 Mar 2020 17:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NeDfNFm6zQQ+Vr4l4/4YXx+ZnichF47L1NlXOTWoyfo=;
	b=EX5zrxw2f1NANIprCJj3EVvQOacz0UIiRHlu3pNbYt2/a9g9Y1bspGKTHB35Bpwbuk
	KOEs11cjwUOxF9c/BeqZmF4yKarcg3hTCnpFn++cH6oLwnFckfG2rNZMDsLrDsdSbi3s
	IvQ3ifZHASyf5BdCBcXkoQXMm1y4dtr4Z75sKMn4HX+Mo+ADCOkKMuPXxBQqIrpqfiN7
	EeIwA9hdLAmsn60ZDFJGgj5YRejnJv/EMIBMF/x+UQmj1FC+8mKDJDB26cwa5FKHvABY
	6tJkT65vRcjZLvF0+SjxdULxH/9FEnkWlK7mhj5cZxk2FSpD+mJvII1yxzaONkKPYEOR
	aWEA==
X-Gm-Message-State: ANhLgQ318ME/QE2ASANgqxu11DoR12s9r1pXSjyq1ue9Kd/malJ2fsnb
	MrA/hp7Se55rkIVhbrmRnCQgrv0BzTzrUf5zh+wG2GU=
X-Google-Smtp-Source: ADFU+vsXrPS3Kfl8rBPlUohdjdVshORZuYnyNmVhI7cXRuUBPYg/+jO3/hb6G3fnVcfU/HU/RvG4XyZkSElYpNLKFS4=
X-Received: by 2002:aa7:c1d3:: with SMTP id d19mr19537356edp.12.1583801727876; 
	Mon, 09 Mar 2020 17:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-4-casey@schaufler-ca.com>
	<CAHC9VhS+3K-AAzo2Z9iYTCx6wax0h2_grXayULDWsCFKezf8Jg@mail.gmail.com>
	<d6d50183-c10b-e565-3e90-5fa7bc6b5841@schaufler-ca.com>
In-Reply-To: <d6d50183-c10b-e565-3e90-5fa7bc6b5841@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Mar 2020 20:55:16 -0400
Message-ID: <CAHC9VhR+p52R8rSsuYuyFhn5EZZDOAeHnEY=5WPM0vc4EP4Ezw@mail.gmail.com>
Subject: Re: [PATCH v15 03/23] LSM: Use lsmblob in security_audit_rule_match
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02A0tYDG003825
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

On Mon, Mar 9, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 3/6/2020 2:01 PM, Paul Moore wrote:
> > On Fri, Feb 21, 2020 at 7:04 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> Change the secid parameter of security_audit_rule_match
> >> to a lsmblob structure pointer. Pass the entry from the
> >> lsmblob structure for the approprite slot to the LSM hook.
> >>
> >> Change the users of security_audit_rule_match to use the
> >> lsmblob instead of a u32. In some cases this requires a
> >> temporary conversion using lsmblob_init() that will go
> >> away when other interfaces get converted.
> >>
> >> Reviewed-by: Kees Cook <keescook@chromium.org>
> >> Reviewed-by: John Johansen <john.johansen@canonical.com>
> >> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> ---
> >>  include/linux/security.h            |  7 ++++---
> >>  kernel/auditfilter.c                |  6 ++++--
> >>  kernel/auditsc.c                    | 14 ++++++++++----
> >>  security/integrity/ima/ima.h        |  4 ++--
> >>  security/integrity/ima/ima_policy.c |  7 +++++--
> >>  security/security.c                 |  8 +++++---
> >>  6 files changed, 30 insertions(+), 16 deletions(-)
> > ...
> >
> >> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> >> index 3a44abf4fced..509eb21eff7f 100644
> >> --- a/kernel/auditfilter.c
> >> +++ b/kernel/auditfilter.c
> >> @@ -1327,6 +1327,7 @@ int audit_filter(int msgtype, unsigned int listtype)
> >>                         struct audit_field *f = &e->rule.fields[i];
> >>                         pid_t pid;
> >>                         u32 sid;
> >> +                       struct lsmblob blob;
> >>
> >>                         switch (f->type) {
> >>                         case AUDIT_PID:
> >> @@ -1357,8 +1358,9 @@ int audit_filter(int msgtype, unsigned int listtype)
> >>                         case AUDIT_SUBJ_CLR:
> >>                                 if (f->lsm_isset) {
> >>                                         security_task_getsecid(current, &sid);
> >> -                                       result = security_audit_rule_match(sid,
> >> -                                                  f->type, f->op,
> >> +                                       lsmblob_init(&blob, sid);
> >> +                                       result = security_audit_rule_match(
> >> +                                                  &blob, f->type, f->op,
> >>                                                    f->lsm_rules);
> > Unless I'm mistaken this patch is almost exclusively the following pattern:
> >
> >   lsmblob_init(blob, sid);
> >   security_audit_rule_match(blob, ...);
> >
> > ... which means we are assigning every array member in @blob the same
> > value of "sid" and then sending that into the LSM where each LSM is
> > going to then have to index into that array, to all get the same
> > value, and then do their match.  I'm assuming this will make more
> > sense as I progress through the rest of the patchset, but right now it
> > seems like we could get by just fine with a u32 here.
>
> When I do the next version I'll put considerably more effort into
> explaining the scaffolding strategy. I'm definitely in that area where
> the advantage of keeping patches small and the advantage of making a
> change obvious are at odds. This will apply to the next few patches in
> the series as well.

Yes, it's a hard line to walk.  If it helps any, I try to go by two
guiding principles when writing or reviewing a patch:

* each patch must have some standalone value
* each patch must make sense in the context of itself and the code
which preceded it

... which is where the hand-wavy "trust me it's coming" scaffolding
approach tends to fall apart.  I'm sure others have more developed
ideas on this, but that is the basis of my comments.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

