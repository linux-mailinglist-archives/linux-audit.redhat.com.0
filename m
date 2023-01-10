Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1156663606
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 01:07:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673309220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2cEvhfcvp7Vz5GD+YKo7czu+1CxwjS71gLfsDMPlBos=;
	b=Si9NirOtOXAg1Tk2C9LA1fbRva6mX3qPGUvNhNpLpeG5f80aZvHt3fNZVNj48wh4DEFwMt
	NaKlfa1VTTNDXNPpXZqewXVA9/OkhU2iSkQNLnGdq7wXHXtHNoZP1gLkj1g1FuaU+aTxFI
	D4uEJAaqGFednleHXStrTJtHkQ6B0X4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-N-SUL1jCO-aCMCmctavbbw-1; Mon, 09 Jan 2023 19:06:58 -0500
X-MC-Unique: N-SUL1jCO-aCMCmctavbbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B30A21C07541;
	Tue, 10 Jan 2023 00:06:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BD6C140EBF6;
	Tue, 10 Jan 2023 00:06:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E8F91940375;
	Tue, 10 Jan 2023 00:06:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 664921946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 00:06:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C6DB1400E44; Tue, 10 Jan 2023 00:06:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.32.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F453140EBF5;
 Tue, 10 Jan 2023 00:06:43 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v5 3/3] fanotify,
 audit: Allow audit to use the full permission event response
Date: Mon, 09 Jan 2023 19:06:42 -0500
Message-ID: <3211441.aeNJFYEL58@x2>
Organization: Red Hat
In-Reply-To: <79fcf72ea442eeede53ed5e6de567f8df8ef7d83.1670606054.git.rgb@redhat.com>
References: <cover.1670606054.git.rgb@redhat.com>
 <79fcf72ea442eeede53ed5e6de567f8df8ef7d83.1670606054.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Sorry to take so long. Holidays and kernel build problems. However, I have 
built a kernel with these patches. I only have 2 comments. When I use an 
application that expected the old API, meaning it simply does:

        response.fd = metadata->fd;
        response.response = reply;
        close(metadata->fd);
        write(fd, &response, sizeof(struct fanotify_response));

I get access denials. Every time. If the program is using the new API and 
sets FAN_INFO, then it works as expected. I'll do some more testing but I 
think there is something wrong in the compatibility path.

On Monday, December 12, 2022 9:06:11 AM EST Richard Guy Briggs wrote:
> This patch passes the full response so that the audit function can use all
> of it. The audit function was updated to log the additional information in
> the AUDIT_FANOTIFY record.

What I'm seeing is:

type=FANOTIFY msg=audit(01/09/2023 18:43:16.306:366) : resp=deny fan_type=1 
fan_info=313300000000000000000000 subj_trust=0 obj_trust=0

Where fan_info was supposed to be 13 decimal. More below...

> Currently the only type of fanotify info that is defined is an audit
> rule number, but convert it to hex encoding to future-proof the field.
> Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
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
>  kernel/auditsc.c              | 25 ++++++++++++++++++++++---
>  3 files changed, 29 insertions(+), 8 deletions(-)
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
>  	context->type = AUDIT_KERN_MODULE;
>  }
> 
> -void __audit_fanotify(u32 response)
> +void __audit_fanotify(u32 response, struct
> fanotify_response_info_audit_rule *friar) {
> -	audit_log(audit_context(), GFP_KERNEL,
> -		AUDIT_FANOTIFY,	"resp=%u", response);
> +	struct audit_context *ctx = audit_context();
> +	struct audit_buffer *ab;
> +	char numbuf[12];
> +
> +	if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> +		audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> +			  "resp=%u fan_type=%u fan_info=3F subj_trust=2 
obj_trust=2",
> +			  response, FAN_RESPONSE_INFO_NONE);
> +		return;
> +	}
> +	ab = audit_log_start(ctx, GFP_KERNEL, AUDIT_FANOTIFY);
> +	if (ab) {
> +		audit_log_format(ab, "resp=%u fan_type=%u fan_info=",
> +				 response, friar->hdr.type);
> +		snprintf(numbuf, sizeof(numbuf), "%u", friar->rule_number);
> +		audit_log_n_hex(ab, numbuf, sizeof(numbuf));

I don't think it needs to be converted to ascii and then hexencoded. As Paul 
said, probably %X is all we need here.

-Steve


> +		audit_log_format(ab, " subj_trust=%u obj_trust=%u",
> +				 friar->subj_trust, friar->obj_trust);
> +		audit_log_end(ab);
> +	}
>  }
> 
>  void __audit_tk_injoffset(struct timespec64 offset)




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

