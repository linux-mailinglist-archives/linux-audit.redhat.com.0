Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A0940456F8
	for <lists+linux-audit@lfdr.de>; Fri, 14 Jun 2019 10:07:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB816C058CBD;
	Fri, 14 Jun 2019 08:06:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB3F610AA;
	Fri, 14 Jun 2019 08:06:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 441951833002;
	Fri, 14 Jun 2019 08:06:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5E85ABw029493 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 14 Jun 2019 04:05:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44DC566D44; Fri, 14 Jun 2019 08:05:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB4366D47
	for <linux-audit@redhat.com>; Fri, 14 Jun 2019 08:05:06 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6523F7FDFC
	for <linux-audit@redhat.com>; Fri, 14 Jun 2019 08:05:06 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id a198so534314oii.15
	for <linux-audit@redhat.com>; Fri, 14 Jun 2019 01:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j+cBvUSvUwljJzZGmDUiwDo+HPkbVxvHXHt9BRXDb/A=;
	b=fJ6AV89B38WfwR2OwLfj7mVved3LfVX48w2Taoqx/5zHyr42Z8UEUO1plfOCnLm2hY
	fUiFmoAG+8vRgv/Z/cSrNCO67VqIKPqz6AZrfUcDQKr/ztVoJvLHJ+XEMKm2MyrdS4ed
	kuMZZkdGn0WszorGQWsEZ92gS07eLFafAgKhlwOednSkvkIRW01qWI8H2Hw8UM/sl0FI
	yMEDEsF2ReiSbiBSQvdfrZzhvvxxDw2UqxgicnK9SWaUA5ACbESnDER+69qe18BUoxCT
	EUQOVOpFbcKNoNr4Ko4AjuwxU8qF6lYwOjbG+TxsEVmU4RfDvcJYrpSDT3Sk2g3TbsrO
	yNbA==
X-Gm-Message-State: APjAAAXkYT6pwy9FN3TSLpe3dJVjhIM7ZV+BcAeurFuSTBBtW60JSlKW
	nQ6zkSQFejvc0Th7VGiCnsY0haB4VUnSsf9UkHxDLZw1ptshOb6Qz/yl0NrYHteuDkwcX45CZbq
	GXSozj4D8Rg/aihvfaYrXergaLfsz1PksrD8=
X-Received: by 2002:a9d:73cd:: with SMTP id m13mr10590118otk.43.1560499505743; 
	Fri, 14 Jun 2019 01:05:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws/BIn0xh694klgJH9Xrz/VJPcXmFAB6yMRzOoeD0HBCOu65JzqDT8ctr6waWftZDpsINN+tTG3pDGakWWlc8=
X-Received: by 2002:a9d:73cd:: with SMTP id m13mr10590092otk.43.1560499505394; 
	Fri, 14 Jun 2019 01:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <53af233d05da5e07d75d122878387288a10276df.1560447640.git.rgb@redhat.com>
In-Reply-To: <53af233d05da5e07d75d122878387288a10276df.1560447640.git.rgb@redhat.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Fri, 14 Jun 2019 10:04:54 +0200
Message-ID: <CAFqZXNvTAj_MhgbUB0kbQwF+gDQTTO5jXPagQfW9qwfHEzc1iQ@mail.gmail.com>
Subject: Re: [PATCH ghak57 V1] selinux: format all invalid context as untrusted
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 14 Jun 2019 08:07:18 +0000 (UTC)

On Thu, Jun 13, 2019 at 8:43 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> All instances of one field type should be encoded in the same way.
> Since some invalid_context fields can contain untrusted strings, encode
> all instances of this field the same way.
>
> Please see github issue
> https://github.com/linux-audit/audit-kernel/issues/57

I would add at least a short explanation ("The userspace tools expects
all fields of the same name to be logged consistently.") directly to
the commit message. Funny that Paul warned about this on the SELinux
ML just yesterday :) [1]

>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Passes audit-testsuite.
>
>  security/selinux/ss/services.c | 48 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 10 deletions(-)
>
> diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
> index cc043bc8fd4c..817576802f7d 100644
> --- a/security/selinux/ss/services.c
> +++ b/security/selinux/ss/services.c
> @@ -1588,6 +1588,8 @@ static int compute_sid_handle_invalid_context(
>         struct policydb *policydb = &state->ss->policydb;
>         char *s = NULL, *t = NULL, *n = NULL;
>         u32 slen, tlen, nlen;
> +       struct audit_buffer *ab;
> +       size_t audit_size;
>
>         if (context_struct_to_string(policydb, scontext, &s, &slen))
>                 goto out;
> @@ -1595,12 +1597,22 @@ static int compute_sid_handle_invalid_context(
>                 goto out;
>         if (context_struct_to_string(policydb, newcontext, &n, &nlen))
>                 goto out;
> -       audit_log(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR,
> -                 "op=security_compute_sid invalid_context=%s"
> -                 " scontext=%s"
> -                 " tcontext=%s"
> -                 " tclass=%s",
> -                 n, s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
> +       /* We strip a nul only if it is at the end, otherwise the
> +        * context contains a nul and we should audit that */
> +       if (n) {
> +               if (n[nlen - 1] == '\0')
> +                       audit_size = nlen - 1;
> +               else
> +                       audit_size = nlen;
> +       } else {
> +               audit_size = 0;
> +       }

If you reasonably assume that (n == NULL) implies (nlen == 0), then
you can simplify this down to:

    audit_size = nlen;
    if (nlen && n[nlen - 1] == '\0')
        audit_size--;

(or similar), see my recent patch to log *rawcon as untrusted [2].
That is IMHO faster to parse. But I see you copied it from
selinux_inode_setxattr(), where it is like this... I'm not sure if it
is worth changing this patch / consolidating the style across all
places that do this / creating a helper function...

> +       ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR);
> +       audit_log_format(ab, "op=security_compute_sid invalid_context=");
> +       audit_log_n_untrustedstring(ab, n, audit_size);
> +       audit_log_format(ab, " scontext=%s tcontext=%s tclass=%s",
> +                        s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
> +       audit_log_end(ab);
>  out:
>         kfree(s);
>         kfree(t);
> @@ -3007,10 +3019,26 @@ int security_sid_mls_copy(struct selinux_state *state,
>                 if (rc) {
>                         if (!context_struct_to_string(policydb, &newcon, &s,
>                                                       &len)) {
> -                               audit_log(audit_context(),
> -                                         GFP_ATOMIC, AUDIT_SELINUX_ERR,
> -                                         "op=security_sid_mls_copy "
> -                                         "invalid_context=%s", s);
> +                               struct audit_buffer *ab;
> +                               size_t audit_size;
> +
> +                               /* We strip a nul only if it is at the
> +                                * end, otherwise the context contains a
> +                                * nul and we should audit that */
> +                               if (s) {
> +                                       if (s[len - 1] == '\0')
> +                                               audit_size = len - 1;
> +                                       else
> +                                               audit_size = len;
> +                               } else {
> +                                       audit_size = 0;
> +                               }

analogically here ^^

[1] https://lore.kernel.org/selinux/CAHC9VhRwKjp9qwqMB3p7intdpxFT1oYVOUKmoEcwZcN1VAC-UA@mail.gmail.com/T/#m1515af36ca98dceddfb6c9f795e1dfa2ac6e8a1b
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git/commit/?h=stable-5.2&id=aff7ed4851680d0d28ad9f52cd2f99213e1371b2


> +                               ab = audit_log_start(audit_context(),
> +                                                    GFP_ATOMIC,
> +                                                    AUDIT_SELINUX_ERR);
> +                               audit_log_format(ab, "op=security_sid_mls_copy invalid_context=");
> +                               audit_log_n_untrustedstring(ab, s, audit_size);
> +                               audit_log_end(ab);
>                                 kfree(s);
>                         }
>                         goto out_unlock;
> --
> 1.8.3.1
>

--
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
