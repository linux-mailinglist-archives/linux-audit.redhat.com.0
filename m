Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 581736529E1
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 00:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671579123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SUSU9Vrf2xOrc10nW5EXaw8jbM02EuwUwH/oDNIafxU=;
	b=AywXdjaNQuIbsIbkWhMNfDPWaQITPZBzCJA1JA3ZGFb1GPSow+vNkBgCLM9YkwE7nB6DNU
	QbuPlrruq9IF1Ca4uoUKwReQQtQzS62Dfe8+myxku3NIaxKWgfhNKAgHDfrHYNrsH4zK7p
	nWAxm+J7hfkyVOLCqn2HHyb1aAfXyk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-OQEcNNi5P3iauhBiP6mVSg-1; Tue, 20 Dec 2022 18:32:01 -0500
X-MC-Unique: OQEcNNi5P3iauhBiP6mVSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F31B85C6E4;
	Tue, 20 Dec 2022 23:31:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F354140E90F;
	Tue, 20 Dec 2022 23:31:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EDCA819465B3;
	Tue, 20 Dec 2022 23:31:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C33E19465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 20 Dec 2022 23:31:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69BF84014D1A; Tue, 20 Dec 2022 23:31:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6289A400D79E
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 23:31:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47C46299E741
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 23:31:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-wXHiyNvYMeeGuEMUMYOpsg-1; Tue, 20 Dec 2022 18:31:55 -0500
X-MC-Unique: wXHiyNvYMeeGuEMUMYOpsg-1
Received: by mail-pj1-f45.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso354816pjp.4
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 15:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNvwx1f2Fh9J2I3ow+8tnVvZQ5g3r2kgzwtdsL7kVXU=;
 b=Px5HMORzm5ZFylLs/cH1V6EeGTLC3UPJ9h70akzhtxeHLokT/oqzSbMP5urXzk+AyZ
 7OEI4fiqy9vASEBqDzy1OF5XUNRTYbU5tb8MPp4CJn9TOg5ZEKqyf0VwlTtFfHj/25ND
 jzYxbKFVpzFuu5OsAWpSDN//wXf1hZD8wDgn0Y1i/+KZztaxpNDxvWaONzdnbdf2uUce
 bJN7iAqFQQpwYMQlHE/4/+003IvdYoQeylaNdzUYrVRhD/Nq4CKZZ/MH3AgmZufzGw+C
 7ok0pn+byaTsRcJKZosTDNKWzg7Y8ZnmY0nu09eZFl9fwBJv5YnHdyh+ZfUXJOvikGRF
 xGZg==
X-Gm-Message-State: AFqh2kq8ixL2lYkkNFT4wtxHrsObKdZpQSIyJXng4tbLAYjvDyZJfNkl
 0p4AkIMWFbc9tBFQJm/0VaHtvIJLN1S1Hi9+hsT/
X-Google-Smtp-Source: AMrXdXvBpq9QnNE8Y4rIAjEUbNiQzoI2AuEU1LAlXJlJ3cXz5EoaZFQzreLaQrZb/OX0AgiBktAoy1GSdjW3Et+zoLw=
X-Received: by 2002:a17:90a:6481:b0:221:5597:5de7 with SMTP id
 h1-20020a17090a648100b0022155975de7mr2001291pjj.147.1671579114449; Tue, 20
 Dec 2022 15:31:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670606054.git.rgb@redhat.com>
 <79fcf72ea442eeede53ed5e6de567f8df8ef7d83.1670606054.git.rgb@redhat.com>
In-Reply-To: <79fcf72ea442eeede53ed5e6de567f8df8ef7d83.1670606054.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Dec 2022 18:31:43 -0500
Message-ID: <CAHC9VhQont7=S9pvTpLUmxVSj-g-j2ZhVCLiUki69vtp8rf-9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] fanotify,audit: Allow audit to use the full
 permission event response
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 9:06 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> This patch passes the full response so that the audit function can use all
> of it. The audit function was updated to log the additional information in
> the AUDIT_FANOTIFY record.
>
> Currently the only type of fanotify info that is defined is an audit
> rule number, but convert it to hex encoding to future-proof the field.
> Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
>
> Sample records:
>   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
>   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F subj_trust=2 obj_trust=2
>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Link: https://lore.kernel.org/r/3075502.aeNJFYEL58@x2
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  fs/notify/fanotify/fanotify.c |  3 ++-
>  include/linux/audit.h         |  9 +++++----
>  kernel/auditsc.c              | 25 ++++++++++++++++++++++---
>  3 files changed, 29 insertions(+), 8 deletions(-)

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index d1fb821de104..8d523066d81f 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -64,6 +64,7 @@
>  #include <uapi/linux/limits.h>
>  #include <uapi/linux/netfilter/nf_tables.h>
>  #include <uapi/linux/openat2.h> // struct open_how
> +#include <uapi/linux/fanotify.h>
>
>  #include "audit.h"
>
> @@ -2877,10 +2878,28 @@ void __audit_log_kern_module(char *name)
>         context->type = AUDIT_KERN_MODULE;
>  }
>
> -void __audit_fanotify(u32 response)
> +void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar)
>  {
> -       audit_log(audit_context(), GFP_KERNEL,
> -               AUDIT_FANOTIFY, "resp=%u", response);
> +       struct audit_context *ctx = audit_context();
> +       struct audit_buffer *ab;
> +       char numbuf[12];
> +
> +       if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> +               audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> +                         "resp=%u fan_type=%u fan_info=3F subj_trust=2 obj_trust=2",
> +                         response, FAN_RESPONSE_INFO_NONE);

The fan_info, subj_trust, and obj_trust constant values used here are
awfully magic-numbery and not the usual sentinel values one might
expect for a "none" operation, e.g. zeros/INT_MAX/etc. I believe a
comment here explaining the values would be a good idea.

> +               return;
> +       }
> +       ab = audit_log_start(ctx, GFP_KERNEL, AUDIT_FANOTIFY);
> +       if (ab) {
> +               audit_log_format(ab, "resp=%u fan_type=%u fan_info=",
> +                                response, friar->hdr.type);
> +               snprintf(numbuf, sizeof(numbuf), "%u", friar->rule_number);
> +               audit_log_n_hex(ab, numbuf, sizeof(numbuf));

It looks like the kernel's printf format string parsing supports %X so
why not just use that for now, we can always complicate it later if
needed.  It would probably also remove the need for the @ab, @numbuf,
and @ctx variables.  For example:

audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
  "resp=%u fan_type=%u fan_info=%X subj_trust=%u obj_trust=%u",
  response, friar->hdr.type, friar->rule_number,
  friar->subj_trust, friar->obj_trust);

Am I missing something?

> +               audit_log_format(ab, " subj_trust=%u obj_trust=%u",
> +                                friar->subj_trust, friar->obj_trust);
> +               audit_log_end(ab);
> +       }
>  }
>
>  void __audit_tk_injoffset(struct timespec64 offset)
> --
> 2.27.0

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

