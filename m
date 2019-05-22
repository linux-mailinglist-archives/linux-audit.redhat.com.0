Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68025BFC
	for <lists+linux-audit@lfdr.de>; Wed, 22 May 2019 04:58:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9888B3082E09;
	Wed, 22 May 2019 02:58:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F66F61986;
	Wed, 22 May 2019 02:58:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E0A61806B0F;
	Wed, 22 May 2019 02:58:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4M2wYkY018752 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 22:58:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB95B6013D; Wed, 22 May 2019 02:58:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E41AB60142
	for <linux-audit@redhat.com>; Wed, 22 May 2019 02:58:31 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B18A633025F
	for <linux-audit@redhat.com>; Wed, 22 May 2019 02:58:30 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id e13so597430ljl.11
	for <linux-audit@redhat.com>; Tue, 21 May 2019 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j8PdCLitq9riR6Vw+GpaNeQZZUNGOkXrDZxVSRtX3n0=;
	b=fEMP/5HXj8+m/XODCJgk2gBqKpsVosEm8QELltJxyjpue0p8nvv4fr4cldH1MbJIBJ
	FKhGeurOx1elNgibly8b+jRgEfiK6+5KB9yt1cTEzb85kpB3OkufsamLFr+EWNwGBTIH
	7uB0vVM/6+JmMw+jmUg5ZMvbAYOR/avElTgGYgFXf8KX5SOuNs3zGNqividVrC/f+4XH
	gROzSXFpP0GukDF93eOkSQLfu7vMrzyvWRkF4iDjgJV7wRM1cXmxHddf39sbqSBy+sNB
	zBokB+V/COz0/nHFSaQ2F3txjKoZZokQ8G/XmFeWbHzhB/rsnppD4spHkLIAbgYcoWC6
	jDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j8PdCLitq9riR6Vw+GpaNeQZZUNGOkXrDZxVSRtX3n0=;
	b=p/j6+/43A6Qv+lFh8ZgcYGOo20UcDiEfidE2/57tyNiK5iIu00xCTZJBp7DKVZ7oFk
	HHEShLbKmxauSWzpbBJc1Nx08Ot473w7kVuYI5nbXky57AxSERPKGvhrPzu0TbrIw09v
	4DQUPs95Jhs53upUSGsAYX6l36LcHY4gTHRismWdpy5K30SHQ4X+JmFoFrKJgvyilrgU
	pWnuJmA7Ic3LMVBLy7hHhkTl4iYwE/CaUzqt2/QgJDAe9pIM7DKpMM1VeQwG7h+ihjJt
	UfU5n0bSNRpnBC0pJPiJH2f8sE6RgqIZ0UZujJLMQyQxoHVKjTsti5exzhl9PZG9EV3F
	m45A==
X-Gm-Message-State: APjAAAXnC7N0FBEHESRCQHULoDsdwEHHRBydB066mklfgaV5kHOj2YHY
	XqE0CNAt4TZjBvqM/qq4tnZxniFGz9fw/HMZn8og
X-Google-Smtp-Source: APXvYqxmlE9qNWdocS4oCN93tjxSsX9kqQ7GY4TjeZkA1hiafKJJnzWIx78W7C/NyRC9s/sYHB6nNx7F3v7Kyt/NQq0=
X-Received: by 2002:a2e:5502:: with SMTP id j2mr4433823ljb.63.1558493908879;
	Tue, 21 May 2019 19:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <e0cb73251e93f7a0798a18298cbf688f06a2bc74.1557330625.git.rgb@redhat.com>
In-Reply-To: <e0cb73251e93f7a0798a18298cbf688f06a2bc74.1557330625.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 May 2019 22:58:17 -0400
Message-ID: <CAHC9VhT454EEWkpUXAMar3wk8KBT+ZhMBrXkek08bBM=yca_4g@mail.gmail.com>
Subject: Re: [PATCH ghak73 V2] audit: re-structure audit field valid checks
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 22 May 2019 02:58:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 22 May 2019 02:58:31 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.321  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 22 May 2019 02:58:45 +0000 (UTC)

On Wed, May 8, 2019 at 12:43 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Multiple checks were being done in one switch case statement that
> started to cause some redundancies and awkward exceptions.  Separate the
> valid field and op check from the select valid values checks.
>
> Enforce the elimination of meaningless bitwise and greater/lessthan
> checks on string fields and other fields with unrelated scalar values.
>
> Honour the operator for WATCH, DIR, PERM, FILETYPE fields as is done in
> the EXE field.
>
> Please see the github issue
> https://github.com/linux-audit/audit-kernel/issues/73
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v2:
> - address WATCH, DIR, FILETYPE, PERM lack of op checking
> - touch up switch statement formatting
>
>  kernel/auditfilter.c | 48 ++++++++++++++++++++++++++++++------------------
>  kernel/auditsc.c     | 18 +++++++++++++++---
>  2 files changed, 45 insertions(+), 21 deletions(-)

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 5371b59bde36..4bd0ec60a0e8 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -601,12 +601,20 @@ static int audit_filter_rules(struct task_struct *tsk,
>                         }
>                         break;
>                 case AUDIT_WATCH:
> -                       if (name)
> -                               result = audit_watch_compare(rule->watch, name->ino, name->dev);
> +                       if (name) {
> +                               result = audit_watch_compare(rule->watch,
> +                                                            name->ino,
> +                                                            name->dev);
> +                               if (f->op == Audit_not_equal)
> +                                       result = !result;
> +                       }
>                         break;
>                 case AUDIT_DIR:
> -                       if (ctx)
> +                       if (ctx) {
>                                 result = match_tree_refs(ctx, rule->tree);
> +                               if (f->op == Audit_not_equal)
> +                                       result = !result;
> +                       }
>                         break;
>                 case AUDIT_LOGINUID:
>                         result = audit_uid_comparator(audit_get_loginuid(tsk),
> @@ -684,9 +692,13 @@ static int audit_filter_rules(struct task_struct *tsk,
>                         break;
>                 case AUDIT_PERM:
>                         result = audit_match_perm(ctx, f->val);
> +                       if (f->op == Audit_not_equal)
> +                               result = !result;
>                         break;
>                 case AUDIT_FILETYPE:
>                         result = audit_match_filetype(ctx, f->val);
> +                       if (f->op == Audit_not_equal)
> +                               result = !result;
>                         break;
>                 case AUDIT_FIELD_COMPARE:
>                         result = audit_field_compare(tsk, cred, f, ctx, name);

Other than the fact that Ondrej suggested these changes during review
of this patch's first iteration, is there a reason why you thought it
best to include the audit_filter_rules() changes in with the
audit_field_valid() changes?  I ask because the audit_field_valid()
changes are mostly cosmetic in nature where the audit_filter_rules()
changes actually affect the behavior of the code and there is no
strong connection between the two changes.  It seems like we would be
better off if you split the changes into two patches.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
