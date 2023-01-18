Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0C67270E
	for <lists+linux-audit@lfdr.de>; Wed, 18 Jan 2023 19:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674066903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iMwjWOiIAoLuTAsa1624I4jYP50S4GlQ8yqdUtGxq0A=;
	b=OvoRDcjOv2e+QOVlmWwS5DHoJK5N27fWbAECV4pb0YcLmb+qe+F55i39oaFQ+wsgGSmMpa
	5fExyFn8p7g4g5U5BRrtVTnUSMMgt+sHcQW3J2KswvTPOFwWCfYNy32XbKEDUvns4UZOdM
	hmxVc8yLmtRdgnPJDb5dmD8XQTvUkSQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-2rHhbraAPyiC2bsZamJucg-1; Wed, 18 Jan 2023 13:34:59 -0500
X-MC-Unique: 2rHhbraAPyiC2bsZamJucg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A444D29AA3BD;
	Wed, 18 Jan 2023 18:34:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A49140C2064;
	Wed, 18 Jan 2023 18:34:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02EC21946A74;
	Wed, 18 Jan 2023 18:34:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC7AA1946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 18:34:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CCB44492B01; Wed, 18 Jan 2023 18:34:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2EA492B00;
 Wed, 18 Jan 2023 18:34:45 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v6 3/3] fanotify,
 audit: Allow audit to use the full permission event response
Date: Wed, 18 Jan 2023 13:34:44 -0500
Message-ID: <5680172.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
 Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Richard,

I built a new kernel and tested this with old and new user space. It is 
working as advertised. The only thing I'm wondering about is why we have 3F 
as the default value when no additional info was sent? Would it be better to 
just make it 0?  Btw, the change to %X makes life easier. Thx.

-Steve


On Tuesday, January 17, 2023 4:14:07 PM EST Richard Guy Briggs wrote:
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
>   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1
> fan_info=3137 subj_trust=3 obj_trust=5 type=FANOTIFY
> msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F subj_trust=2
> obj_trust=2
> 
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Link: https://lore.kernel.org/r/3075502.aeNJFYEL58@x2
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  fs/notify/fanotify/fanotify.c |  3 ++-
>  include/linux/audit.h         |  9 +++++----
>  kernel/auditsc.c              | 16 +++++++++++++---
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
> index 24ec1d66d5a8..29bdd99b29fa 100644
> --- a/fs/notify/fanotify/fanotify.c
> +++ b/fs/notify/fanotify/fanotify.c
> @@ -273,7 +273,8 @@ static int fanotify_get_response(struct fsnotify_group
> *group,
> 
>  	/* Check if the response should be audited */
>  	if (event->response & FAN_AUDIT)
> -		audit_fanotify(event->response & ~FAN_AUDIT);
> +		audit_fanotify(event->response & ~FAN_AUDIT,
> +			       &event->audit_rule);
> 
>  	pr_debug("%s: group=%p event=%p about to return ret=%d\n", __func__,
>  		 group, event, ret);
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index d6b7d0c7ce43..31086a72e32a 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -14,6 +14,7 @@
>  #include <linux/audit_arch.h>
>  #include <uapi/linux/audit.h>
>  #include <uapi/linux/netfilter/nf_tables.h>
> +#include <uapi/linux/fanotify.h>
> 
>  #define AUDIT_INO_UNSET ((unsigned long)-1)
>  #define AUDIT_DEV_UNSET ((dev_t)-1)
> @@ -416,7 +417,7 @@ extern void __audit_log_capset(const struct cred *new,
> const struct cred *old); extern void __audit_mmap_fd(int fd, int flags);
>  extern void __audit_openat2_how(struct open_how *how);
>  extern void __audit_log_kern_module(char *name);
> -extern void __audit_fanotify(u32 response);
> +extern void __audit_fanotify(u32 response, struct
> fanotify_response_info_audit_rule *friar); extern void
> __audit_tk_injoffset(struct timespec64 offset);
>  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
>  extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int
> nentries, @@ -523,10 +524,10 @@ static inline void
> audit_log_kern_module(char *name) __audit_log_kern_module(name);
>  }
> 
> -static inline void audit_fanotify(u32 response)
> +static inline void audit_fanotify(u32 response, struct
> fanotify_response_info_audit_rule *friar) {
>  	if (!audit_dummy_context())
> -		__audit_fanotify(response);
> +		__audit_fanotify(response, friar);
>  }
> 
>  static inline void audit_tk_injoffset(struct timespec64 offset)
> @@ -679,7 +680,7 @@ static inline void audit_log_kern_module(char *name)
>  {
>  }
> 
> -static inline void audit_fanotify(u32 response)
> +static inline void audit_fanotify(u32 response, struct
> fanotify_response_info_audit_rule *friar) { }
> 
>  static inline void audit_tk_injoffset(struct timespec64 offset)
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index d1fb821de104..3133c4175c15 100644
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
> @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
>  	context->type = AUDIT_KERN_MODULE;
>  }
> 
> -void __audit_fanotify(u32 response)
> +void __audit_fanotify(u32 response, struct
> fanotify_response_info_audit_rule *friar) {
> -	audit_log(audit_context(), GFP_KERNEL,
> -		AUDIT_FANOTIFY,	"resp=%u", response);
> +	/* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> +	if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> +		audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> +			  "resp=%u fan_type=%u fan_info=3F subj_trust=2 
obj_trust=2",
> +			  response, FAN_RESPONSE_INFO_NONE);
> +		return;
> +	}
> +	audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> +		  "resp=%u fan_type=%u fan_info=%X subj_trust=%u 
obj_trust=%u",
> +		  response, friar->hdr.type, friar->rule_number,
> +		  friar->subj_trust, friar->obj_trust);
>  }
> 
>  void __audit_tk_injoffset(struct timespec64 offset)




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

