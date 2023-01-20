Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BF675D40
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 19:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cxaduTH7CLguIuiwa00jYAJ3mJVl4Aqztmh4UNbpQWU=;
	b=UP+DSHEMjdd8BJvAK3aIoqOLZmPHTKRGPB+krCGjxFdls1Bvl7CnZ6hGwo1necKKTVypdG
	9wynFoRzJ3U0CnzPoBgp5jelDWHxwXfgc4OnalXHnKLjsG2iBNfPbD7V5Lggm8Fex0OPag
	FKP2PDOHOFUigGRildcMCu+8QCadWh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-6qQdIQxrOa-20CRL7LwLrg-1; Fri, 20 Jan 2023 13:59:37 -0500
X-MC-Unique: 6qQdIQxrOa-20CRL7LwLrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 801EF85C1AB;
	Fri, 20 Jan 2023 18:59:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E77B040C2064;
	Fri, 20 Jan 2023 18:59:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72CE11946A77;
	Fri, 20 Jan 2023 18:59:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EC7F1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 18:59:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E7884014EBE; Fri, 20 Jan 2023 18:59:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 075F940C6EC4
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 18:59:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF89D85C1A4
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 18:59:32 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-82VVZuLfMfaSPEstXNYbUA-1; Fri, 20 Jan 2023 13:59:22 -0500
X-MC-Unique: 82VVZuLfMfaSPEstXNYbUA-1
Received: by mail-pl1-f169.google.com with SMTP id v23so6161220plo.1
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 10:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGi7Fd7MCMNA1QbBTQeJ0YgM+KM/Q0j6YdyrOcqHQyg=;
 b=A8qBvTxM5LOnpaxEcodD3uMAhtiXeWGvwi0tFIlOoAEVuX+CbuYOz2qsLGUyKYpEgf
 KnhPZZPDpjqMVAFUmnTzym9oJ5OwBPRRXU6juZfAAKx8yWNIV/8l+kTkcni66vIeGVZg
 1ddl7MdYkiZgERUXOslPIE4RmGr6DjHVKtcOKrzzsJJV5fT1kFZzTCPcRyRn+htXqfpl
 wNl64D0t3bdjvIMbbA91p8wEj1cTrGLEP4K3JANtCtF8uN+QPj7Ga/bqzKTXKl/jobDg
 17N9OydtOkyO66Qz0pPkOO5RDcz7v9IlrAHvfqK1o25Iiv11n51IaelBHeNHXGmQ9a2/
 NPeQ==
X-Gm-Message-State: AFqh2kp/q1UZSorztGT3ypRkl2/Fl/ZW4v/aQo1Tp4CLoyw1OlC+b3ZQ
 NUQ4GSYS3laDyA+q5mgFkb8+1P5Wdygk44TFI342
X-Google-Smtp-Source: AMrXdXv1EvsSKj6cBEZSgfojuR+NDh6GI91jSVXXXVvUq1XUrgEqDaNqOzBTs/FIVGle64jfvZ5hUS6q9GmG9EWAy7I=
X-Received: by 2002:a17:90a:c784:b0:227:202b:8eaa with SMTP id
 gn4-20020a17090ac78400b00227202b8eaamr1704350pjb.147.1674241144111; Fri, 20
 Jan 2023 10:59:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
In-Reply-To: <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Jan 2023 13:58:53 -0500
Message-ID: <CAHC9VhTgesdmF3-+oP-EYuNZ-8LKXGPYuSffVst_Wca5Oj0EAQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] fanotify,audit: Allow audit to use the full
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 17, 2023 at 4:14 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> This patch passes the full response so that the audit function can use all
> of it. The audit function was updated to log the additional information in
> the AUDIT_FANOTIFY record.
>
> Currently the only type of fanotify info that is defined is an audit
> rule number, but convert it to hex encoding to future-proof the field.
> Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
>
> The {subj,obj}_trust values are {0,1,2}, corresponding to no, yes, unknown.
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
>  kernel/auditsc.c              | 16 +++++++++++++---
>  3 files changed, 20 insertions(+), 8 deletions(-)

...

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index d1fb821de104..3133c4175c15 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
>         context->type = AUDIT_KERN_MODULE;
>  }
>
> -void __audit_fanotify(u32 response)
> +void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar)
>  {
> -       audit_log(audit_context(), GFP_KERNEL,
> -               AUDIT_FANOTIFY, "resp=%u", response);
> +       /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> +       if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> +               audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> +                         "resp=%u fan_type=%u fan_info=3F subj_trust=2 obj_trust=2",
> +                         response, FAN_RESPONSE_INFO_NONE);
> +               return;
> +       }
> +       audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> +                 "resp=%u fan_type=%u fan_info=%X subj_trust=%u obj_trust=%u",
> +                 response, friar->hdr.type, friar->rule_number,
> +                 friar->subj_trust, friar->obj_trust);
>  }

The only thing that comes to mind might be to convert the if-return
into a switch statement to make it a bit cleaner and easier to patch
in the future, but that is soooo far removed from any real concern
that I debated even mentioning it.  I only bring it up in case the
"3F" discussion results in a respin, and even then I'm not going to
hold my ACK over something as silly as a if-return vs switch.

For clarity, this is what I was thinking:

void __audit_fanontify(...)
{
  switch (type) {
  case FAN_RESPONSE_INFO_NONE:
    audit_log(...);
    break;
  default:
    audit_log(...);
  }
}

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

