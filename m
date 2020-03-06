Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E6D1317C815
	for <lists+linux-audit@lfdr.de>; Fri,  6 Mar 2020 23:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583532167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nRfOj/Tmhuay+VG7cELC7T4cN10zbT0ztwXJun/4nC4=;
	b=DAsdhavVpuNEZq9zvVSNhzfhSJioqUHamld7z7Z3r3R1Qnv0wF8WND+RZ1GArEZOept8Zj
	QzKQ7GrQqklif/Kgr554QlRrQlTvasPivN99xLTz6VBO589myTwd1PI7z7Z3TwQzozvE84
	zPCcEnSvnXCNFZAxfbeHwhPRyMC1QKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-NNXIAiGbN6ir1ILOIYkzqQ-1; Fri, 06 Mar 2020 17:02:45 -0500
X-MC-Unique: NNXIAiGbN6ir1ILOIYkzqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1BE0800D5F;
	Fri,  6 Mar 2020 22:02:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5872963769;
	Fri,  6 Mar 2020 22:02:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0C7484484;
	Fri,  6 Mar 2020 22:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026M2GFP009109 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 17:02:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF3EA10054E8; Fri,  6 Mar 2020 22:02:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA44610054EC
	for <linux-audit@redhat.com>; Fri,  6 Mar 2020 22:02:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E403F185A790
	for <linux-audit@redhat.com>; Fri,  6 Mar 2020 22:02:13 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-Uce6J4HZOG2e4gmWcS0EJw-1; Fri, 06 Mar 2020 17:02:11 -0500
X-MC-Unique: Uce6J4HZOG2e4gmWcS0EJw-1
Received: by mail-ed1-f66.google.com with SMTP id n18so4218714edw.9
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 14:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HzPUZJAVxDVYH1/pNMUBKUbIHs86eyxTlSPN0MyH/0M=;
	b=tcqzLrePXNsdxNZ3dUp6dF7DJoNY2Dq/qSUyf+DSK3TC0LdbbDuAn37aeSJ3YVYfw9
	QUxg0AZtww5bSIFvsr7Jwe1z+x5aqfYeMKvqqsva0Lj1DaJaOPM+sLKmmyCWLq8BnXy1
	ED4JWRsi9UmyUIURnbK5q549Oa1bEALG2crx8GDj633Qk40TO/ktQ44cSBL1KKNQNvki
	vwIpbfuiFKRrMpxkZYU4O726lOvAqwrLNGl94wLNohwNYc9dPYDRy1r58jUr28Hy6pg4
	3U8aFk6x9LLQcWSe1cMZ/iYEEuxzZCArq3alOQU0y7bE91O/HpsBhlj477Lfzy5mb9UA
	zU2w==
X-Gm-Message-State: ANhLgQ0OD4wPlZKziTdg+51UaVp4WQu3alkCUsRGr8xt7H4/mYy3YsDg
	EiALqOotjf9Rdb4VGdi98/mH9odm1uW5KXxt0ZTt
X-Google-Smtp-Source: ADFU+vvm7Azaw2iO1JtaDolOzs615exRLHA8lAkgaNseGNtbM28pjBqetkDFxnFAZgGhaCHHRD+JbemucZ5BroQN5T4=
X-Received: by 2002:aa7:d6c4:: with SMTP id x4mr5156684edr.135.1583532130078; 
	Fri, 06 Mar 2020 14:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-4-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-4-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 17:01:59 -0500
Message-ID: <CAHC9VhS+3K-AAzo2Z9iYTCx6wax0h2_grXayULDWsCFKezf8Jg@mail.gmail.com>
Subject: Re: [PATCH v15 03/23] LSM: Use lsmblob in security_audit_rule_match
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 026M2GFP009109
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:04 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the secid parameter of security_audit_rule_match
> to a lsmblob structure pointer. Pass the entry from the
> lsmblob structure for the approprite slot to the LSM hook.
>
> Change the users of security_audit_rule_match to use the
> lsmblob instead of a u32. In some cases this requires a
> temporary conversion using lsmblob_init() that will go
> away when other interfaces get converted.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h            |  7 ++++---
>  kernel/auditfilter.c                |  6 ++++--
>  kernel/auditsc.c                    | 14 ++++++++++----
>  security/integrity/ima/ima.h        |  4 ++--
>  security/integrity/ima/ima_policy.c |  7 +++++--
>  security/security.c                 |  8 +++++---
>  6 files changed, 30 insertions(+), 16 deletions(-)

...

> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index 3a44abf4fced..509eb21eff7f 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -1327,6 +1327,7 @@ int audit_filter(int msgtype, unsigned int listtype)
>                         struct audit_field *f = &e->rule.fields[i];
>                         pid_t pid;
>                         u32 sid;
> +                       struct lsmblob blob;
>
>                         switch (f->type) {
>                         case AUDIT_PID:
> @@ -1357,8 +1358,9 @@ int audit_filter(int msgtype, unsigned int listtype)
>                         case AUDIT_SUBJ_CLR:
>                                 if (f->lsm_isset) {
>                                         security_task_getsecid(current, &sid);
> -                                       result = security_audit_rule_match(sid,
> -                                                  f->type, f->op,
> +                                       lsmblob_init(&blob, sid);
> +                                       result = security_audit_rule_match(
> +                                                  &blob, f->type, f->op,
>                                                    f->lsm_rules);

Unless I'm mistaken this patch is almost exclusively the following pattern:

  lsmblob_init(blob, sid);
  security_audit_rule_match(blob, ...);

... which means we are assigning every array member in @blob the same
value of "sid" and then sending that into the LSM where each LSM is
going to then have to index into that array, to all get the same
value, and then do their match.  I'm assuming this will make more
sense as I progress through the rest of the patchset, but right now it
seems like we could get by just fine with a u32 here.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

