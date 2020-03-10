Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AA0DF180AD1
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 22:47:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583876824;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+3lIwIqFbtYclc+8bu/TKt8dHXpoMf00c0xA0qcowsI=;
	b=K6a8rjjapUXhNloV6i8HTYd6LDxPYQcp6ek7JbEcttjZ5I4SUXw2SiA/wMWAEBDuhRd1B/
	00yoV4L9LuMiFpRZtcyNRQ0ouJqt4C4vcN45F/zo4VfR1Phr/zM9mrq11h0jDFidG7zWgD
	SsVxEfypr0Q234W5kQgThMhmkQK3pd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-8wPQfQpAPsyaa7bScRRGxQ-1; Tue, 10 Mar 2020 17:47:02 -0400
X-MC-Unique: 8wPQfQpAPsyaa7bScRRGxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D53BF13F9;
	Tue, 10 Mar 2020 21:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 535398F367;
	Tue, 10 Mar 2020 21:46:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5446818089C8;
	Tue, 10 Mar 2020 21:46:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ALknfx015730 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 17:46:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C98C62018036; Tue, 10 Mar 2020 21:46:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C182028CD6
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 21:46:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A61638007AC
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 21:46:47 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-OW37UmW-NMiRPG-PNz_bGw-1; Tue, 10 Mar 2020 17:46:45 -0400
X-MC-Unique: OW37UmW-NMiRPG-PNz_bGw-1
Received: by mail-ed1-f65.google.com with SMTP id g19so225981eds.11
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 14:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yq7nZiCVac93Ecd2XCjYDN0Yc5zZYxN0AL0t0RguGKg=;
	b=sVy1H0hwJigzlIzWMldd5GTHlGTpQPpixOGjaGju6KMqIC9vYPOKuNjyAa9b8y2rJz
	xw1Kjw1bwKfnikSfjdU6ZknIH63br6ErtZ9lxNoN3OKrd1ZTX6ARm2N49rZnGb86a31C
	YX+RXdulDfx84KdYp1TaUYvjRCnhMAcv3q0K+0bW/mMYUYRD3Ex5wu28J1yLsJp2WwH2
	+N0G60DyJ2W4AQ5EoMKCk4z1muNZod/4fEdHdQ56Fcy+2GmLxSlPXLcXF+IPe1wo4TMR
	aQ0I7Q5McrQ+Iruz0K+10BmTCNuPtwU0Q8GkbnvAIPaCWidLCHYkHD0JE+pkMh4TdApq
	F/ZA==
X-Gm-Message-State: ANhLgQ1rmA3X1GVHe4XfgMAMvZl3OfbFJTp6Wmufqa6ChznSEM0O0Wp6
	4h+zj7b1/wKeHCGG5+NCzaO+vlqpNz8X4mihwjjY
X-Google-Smtp-Source: ADFU+vvUhi9HGbD1o2b4tNh71zUI+4Ky/ZKdH2KQHVk22FO0aDV0A9ySrWlHMf9+Ujt2Caq/GYleVl01JPNHbi+skC0=
X-Received: by 2002:a17:906:370a:: with SMTP id
	d10mr21604163ejc.281.1583876803583; 
	Tue, 10 Mar 2020 14:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-13-casey@schaufler-ca.com>
	<CAHC9VhQ+zmB8zxYz0_jfk1SHkkYjUcDpHw1FzKH8G7GkenpH0g@mail.gmail.com>
	<f13ce474-4e96-3132-69da-6438a341d254@schaufler-ca.com>
In-Reply-To: <f13ce474-4e96-3132-69da-6438a341d254@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Mar 2020 17:46:32 -0400
Message-ID: <CAHC9VhRNvxXW9XeCrt9uh5vkvOa52EBHSeP+Veb2xMnXkp08pQ@mail.gmail.com>
Subject: Re: [PATCH v15 20/23] Audit: Add subj_LSM fields when necessary
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ALknfx015730
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

On Mon, Mar 9, 2020 at 9:25 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 3/6/2020 6:24 PM, Paul Moore wrote:
> > On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> Add record entries to identify subject data for all of the
> >> security modules when there is more than one.
> >>
> >> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> Cc: netdev@vger.kernel.org
> >> Cc: linux-audit@redhat.com
> >> ---
> >>  drivers/android/binder.c                |  2 +-
> >>  include/linux/audit.h                   |  1 +
> >>  include/linux/security.h                |  9 ++++-
> >>  include/net/scm.h                       |  3 +-
> >>  kernel/audit.c                          | 40 ++++++++++++++++++-
> >>  kernel/audit_fsnotify.c                 |  1 +
> >>  kernel/auditfilter.c                    |  1 +
> >>  kernel/auditsc.c                        | 10 +++--
> >>  net/ipv4/ip_sockglue.c                  |  2 +-
> >>  net/netfilter/nf_conntrack_netlink.c    |  4 +-
> >>  net/netfilter/nf_conntrack_standalone.c |  2 +-
> >>  net/netfilter/nfnetlink_queue.c         |  2 +-
> >>  net/netlabel/netlabel_unlabeled.c       | 11 ++++--
> >>  net/netlabel/netlabel_user.c            |  2 +-
> >>  net/xfrm/xfrm_policy.c                  |  2 +
> >>  net/xfrm/xfrm_state.c                   |  2 +
> >>  security/integrity/ima/ima_api.c        |  1 +
> >>  security/integrity/integrity_audit.c    |  1 +
> >>  security/security.c                     | 51 +++++++++++++++++++++++--
> >>  19 files changed, 124 insertions(+), 23 deletions(-)
> > ...
> >
> >> diff --git a/kernel/audit.c b/kernel/audit.c
> >> index a25097cfe623..c3a1d8d2d33c 100644
> >> --- a/kernel/audit.c
> >> +++ b/kernel/audit.c
> >> @@ -2054,6 +2061,33 @@ void audit_log_key(struct audit_buffer *ab, char *key)
> >>                 audit_log_format(ab, "(null)");
> >>  }
> >>
> >> +void audit_log_task_lsms(struct audit_buffer *ab)
> >> +{
> >> +       int i;
> >> +       const char *lsm;
> >> +       struct lsmblob blob;
> >> +       struct lsmcontext context;
> >> +
> >> +       /*
> >> +        * Don't do anything unless there is more than one LSM
> >> +        * with a security context to report.
> >> +        */
> >> +       if (security_lsm_slot_name(1) == NULL)
> >> +               return;
> >> +
> >> +       security_task_getsecid(current, &blob);
> >> +
> >> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> >> +               lsm = security_lsm_slot_name(i);
> >> +               if (lsm == NULL)
> >> +                       break;
> >> +               if (security_secid_to_secctx(&blob, &context, i))
> >> +                       continue;
> >> +               audit_log_format(ab, " subj_%s=%s", lsm, context.context);
> >> +               security_release_secctx(&context);
> >> +       }
> >> +}
> >> +
> >>  int audit_log_task_context(struct audit_buffer *ab)
> >>  {
> >>         int error;
> >> @@ -2064,7 +2098,7 @@ int audit_log_task_context(struct audit_buffer *ab)
> >>         if (!lsmblob_is_set(&blob))
> >>                 return 0;
> >>
> >> -       error = security_secid_to_secctx(&blob, &context);
> >> +       error = security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
> >>         if (error) {
> >>                 if (error != -EINVAL)
> >>                         goto error_path;
> > Sorry, please disregard my previous ACK.
>
> :(
>
> > We should treat "subj=" similar to how we treat "obj="; if there is
> > more than one LSM loaded the "subj=" should be set to "?" with the
> > "subj_XXX=" set to the appropriate label for the named LSM.  This
> > patch looks like it is always using LSMBLOB_FIRST and not "?" when
> > multiple LSMs are present.
>
> I'm fine with that, although I could see someone suggesting that
> would constitute breaking backward compatibility.

The argument is the same for both the subject and object fields.  I
maintain that in the brave new world of LSM stacking if you are using
a newly stacked kernel with old userspace, having a "?" for a
subject/object label is much safer than only showing the first LSM's
information and assuming that was the problem.  With a "?" for a
subject/object label you have some indication that something is "not
quite right" and you can dig into it further.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

