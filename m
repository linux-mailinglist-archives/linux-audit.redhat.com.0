Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A79127FEDD
	for <lists+linux-audit@lfdr.de>; Thu,  1 Oct 2020 14:19:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-UtacIfX6Mb-szLUWmuJS7g-1; Thu, 01 Oct 2020 08:18:59 -0400
X-MC-Unique: UtacIfX6Mb-szLUWmuJS7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B604380EF9F;
	Thu,  1 Oct 2020 12:18:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D1B65D9E2;
	Thu,  1 Oct 2020 12:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40D7944A5B;
	Thu,  1 Oct 2020 12:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091ACTVl028180 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 06:12:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02F6A10CD938; Thu,  1 Oct 2020 10:12:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F188210CD936
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 10:12:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3002811E79
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 10:12:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-223---SqnKnoN2Sz8kxbIZce-g-1;
	Thu, 01 Oct 2020 06:12:21 -0400
X-MC-Unique: --SqnKnoN2Sz8kxbIZce-g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E2C18AC2F;
	Thu,  1 Oct 2020 10:12:19 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id A657C1E12EF; Thu,  1 Oct 2020 12:12:19 +0200 (CEST)
Date: Thu, 1 Oct 2020 12:12:19 +0200
From: Jan Kara <jack@suse.cz>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH 2/3] fanotify: define bit map fields to hold response
	decision  context
Message-ID: <20201001101219.GE17860@quack2.suse.cz>
References: <2745105.e9J7NaK4W3@x2>
MIME-Version: 1.0
In-Reply-To: <2745105.e9J7NaK4W3@x2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:18:34 -0400
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
	linux-audit@redhat.com, linux-fsdevel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed 30-09-20 12:12:28, Steve Grubb wrote:
> This patch defines 2 bit maps within the response variable returned from
> user space on a permission event. The first field is 3 bits for the context
> type. The context type will describe what the meaning is of the second bit
> field. The default is none. The patch defines one additional context type
> which means that the second field is a rule number. This will allow for the
> creation of 6 other context types in the future if other users of the API
> identify different needs. The second field is 10 bits wide and can be used
> to pass along the data described by the context. Neither of these bit maps
> are directly adjacent and could be expanded if the need arises.
> 
> To support this, several macros were created to facilitate storing and
> retrieving the values. There is also a macro for user space to check that
> the data being sent is valid. Of course, without this check, anything that
> overflows the bit field will trigger an EINVAL based on the use of
> of INVALID_RESPONSE_MASK in process_access_response().
> 
> Signed-off-by: Steve Grubb <sgrubb@redhat.com>

So how likely do you find other context types are or that you'd need to
further expand the information passed from userspace? Because if there are
decent changes the expansion will be needed then I'd rather do something
like:

struct fanotify_response {
	__s32 fd;
	__u16 response;
	__u16 extra_info_type;
};

which is also backwards compatible and then userspace can set extra_info_type
and based on the type we'd know how much more bytes we need to copy from
buf to get additional information for that info type. 

This is much more flexible than what you propose and not that complex to
implement, you get type safety for extra information and don't need to use
macros to cram everything in u32 etc. Overall cleaner interface I'd say.

So in your case you'd then have something like:

#define FAN_RESPONSE_INFO_AUDIT_RULE 1

struct fanotify_response_audit_rule {
	__u32 rule;
};

								Honza

> ---
>  fs/notify/fanotify/fanotify.c      |  3 +--
>  fs/notify/fanotify/fanotify_user.c |  7 +------
>  include/linux/fanotify.h           |  5 +++++
>  include/uapi/linux/fanotify.h      | 31 ++++++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/notify/fanotify/fanotify.c b/fs/notify/fanotify/fanotify.c
> index 85eda539b35f..e72b7e59aa24 100644
> --- a/fs/notify/fanotify/fanotify.c
> +++ b/fs/notify/fanotify/fanotify.c
> @@ -178,11 +178,10 @@ static int fanotify_get_response(struct fsnotify_group *group,
>  	}
>  
>  	/* userspace responded, convert to something usable */
> -	switch (event->response & ~FAN_AUDIT) {
> +	switch (FAN_DEC_MASK(event->response)) {
>  	case FAN_ALLOW:
>  		ret = 0;
>  		break;
> -	case FAN_DENY:
>  	default:
>  		ret = -EPERM;
>  	}
> diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
> index c8da9ea1e76e..3b8e515904fc 100644
> --- a/fs/notify/fanotify/fanotify_user.c
> +++ b/fs/notify/fanotify/fanotify_user.c
> @@ -187,13 +187,8 @@ static int process_access_response(struct fsnotify_group *group,
>  	 * userspace can send a valid response or we will clean it up after the
>  	 * timeout
>  	 */
> -	switch (response & ~FAN_AUDIT) {
> -	case FAN_ALLOW:
> -	case FAN_DENY:
> -		break;
> -	default:
> +	if (FAN_INVALID_RESPONSE_MASK(response))
>  		return -EINVAL;
> -	}
>  
>  	if (fd < 0)
>  		return -EINVAL;
> diff --git a/include/linux/fanotify.h b/include/linux/fanotify.h
> index b79fa9bb7359..b3281d0e1b55 100644
> --- a/include/linux/fanotify.h
> +++ b/include/linux/fanotify.h
> @@ -72,6 +72,11 @@
>  #define ALL_FANOTIFY_EVENT_BITS		(FANOTIFY_OUTGOING_EVENTS | \
>  					 FANOTIFY_EVENT_FLAGS)
>  
> +/* This mask is to check for invalid bits of a user space permission response */
> +#define FAN_INVALID_RESPONSE_MASK(x) ((x) & ~(FAN_ALLOW | FAN_DENY | \
> +					FAN_AUDIT | FAN_DEC_CONTEXT_TYPE | \
> +					FAN_DEC_CONTEXT))
> +
>  /* Do not use these old uapi constants internally */
>  #undef FAN_ALL_CLASS_BITS
>  #undef FAN_ALL_INIT_FLAGS
> diff --git a/include/uapi/linux/fanotify.h b/include/uapi/linux/fanotify.h
> index a88c7c6d0692..785d68ebcb58 100644
> --- a/include/uapi/linux/fanotify.h
> +++ b/include/uapi/linux/fanotify.h
> @@ -152,6 +152,37 @@ struct fanotify_response {
>  #define FAN_DENY	0x02
>  #define FAN_AUDIT	0x10	/* Bit mask to create audit record for result */
>  
> +/*
> + * User space may need to record additional information about its decision.
> + * The context type records what kind of information is included. A bit mask
> + * defines the type of information included and then the context of the
> + * decision. The context type is 3 bits allowing for 8 kinds of context.
> + * The default is none. We also define 10 bits to allow up to 1024 kinds of
> + * context to be returned.
> + *
> + * If the context type is Rule, then the context following is the rule number
> + * that triggered the user space decision.
> + *
> + * There are helper macros defined so that it can be standardized across tools.
> + * A full example of how user space can use this looks like this:
> + *
> + * if (FAN_DEC_CONTEXT_VALUE_VALID(rule_number))
> + *	response.response = FAN_DENY | FAN_AUDIT | FAN_DEC_CONTEXT_TYPE_RULE |
> + *			    FAN_DEC_CONTEXT_VALUE(rule_number);
> + */
> +#define FAN_DEC_MASK(x) ((x) & (FAN_ALLOW|FAN_DENY))
> +#define FAN_DEC_CONTEXT_TYPE 0x70000000
> +#define FAN_DEC_CONTEXT      0x00FFC000
> +
> +#define FAN_DEC_CONTEXT_TYPE_VALUE(x)    (((x) & 0x07) << 28)
> +#define FAN_DEC_CONTEXT_TYPE_TO_VALUE(x) (((x) & FAN_DEC_CONTEXT_TYPE) >> 28)
> +#define FAN_DEC_CONTEXT_VALUE(x)         (((x) & 0x3FF) << 14)
> +#define FAN_DEC_CONTEXT_TO_VALUE(x)      (((x) & FAN_DEC_CONTEXT) >> 14)
> +#define FAN_DEC_CONTEXT_VALUE_VALID(x)   ((x) >= 0 && (x) < 1024)
> +
> +#define FAN_DEC_CONTEXT_TYPE_NONE  FAN_DEC_CONTEXT_TYPE_VALUE(0)
> +#define FAN_DEC_CONTEXT_TYPE_RULE  FAN_DEC_CONTEXT_TYPE_VALUE(1)
> +
>  /* No fd set in event */
>  #define FAN_NOFD	-1
>  
> -- 
> 2.26.2
> 
> 
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

