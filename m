Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D746522EC
	for <lists+linux-audit@lfdr.de>; Tue, 20 Dec 2022 15:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671547466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MpYyF3VgNweTCuv3O6DhQ0K52o8k6xbc9FpSlfckrMo=;
	b=BX494x78sM1lFJ1CwjWsg/QiOH6ngGo0LMBaOXa2li6xirj4kNqg3x8pziJFOZnVkgiXSV
	PtqjTd383K+jZCs8EbAN/yrVqObt/qtojswHwOfmVzp98KNSzmxCHtRiGNg0d4D3L+EwCh
	oeoaBLB0XnQtuUHha3LzECxUXugtBJc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-bJWPb3jbO06hShs0cBXVjQ-1; Tue, 20 Dec 2022 09:44:25 -0500
X-MC-Unique: bJWPb3jbO06hShs0cBXVjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39931887404;
	Tue, 20 Dec 2022 14:44:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B27814171B8;
	Tue, 20 Dec 2022 14:44:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1AEB21946A6C;
	Tue, 20 Dec 2022 14:44:10 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E00171946594 for <linux-audit@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 16:52:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D12DF1121318; Fri, 16 Dec 2022 16:52:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5D61121314
 for <linux-audit@redhat.com>; Fri, 16 Dec 2022 16:52:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABAA318A6461
 for <linux-audit@redhat.com>; Fri, 16 Dec 2022 16:52:48 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-656-9By3bd2xMQevRB1AhnMDUA-1; Fri,
 16 Dec 2022 11:52:46 -0500
X-MC-Unique: 9By3bd2xMQevRB1AhnMDUA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B54D234588;
 Fri, 16 Dec 2022 16:43:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C3AD138FD;
 Fri, 16 Dec 2022 16:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mr41IkCgnGOILgAAMHmgww
 (envelope-from <jack@suse.cz>); Fri, 16 Dec 2022 16:43:44 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 894A4A0762; Fri, 16 Dec 2022 17:43:42 +0100 (CET)
Date: Fri, 16 Dec 2022 17:43:42 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Message-ID: <20221216164342.ojcbdifdmafq5njw@quack3>
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 20 Dec 2022 14:44:08 +0000
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon 12-12-22 09:06:10, Richard Guy Briggs wrote:
> This patch adds a flag, FAN_INFO and an extensible buffer to provide
> additional information about response decisions.  The buffer contains
> one or more headers defining the information type and the length of the
> following information.  The patch defines one additional information
> type, FAN_RESPONSE_INFO_AUDIT_RULE, to audit a rule number.  This will
> allow for the creation of other information types in the future if other
> users of the API identify different needs.
> 
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Link: https://lore.kernel.org/r/2745105.e9J7NaK4W3@x2
> Suggested-by: Jan Kara <jack@suse.cz>
> Link: https://lore.kernel.org/r/20201001101219.GE17860@quack2.suse.cz
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

Thanks for the patches. They look very good to me. Just two nits below. I
can do the small updates on commit if there would be no other changes. But
I'd like to get some review from audit guys for patch 3/3 before I commit
this.

> diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
> index caa1211bac8c..cf3584351e00 100644
> --- a/fs/notify/fanotify/fanotify_user.c
> +++ b/fs/notify/fanotify/fanotify_user.c
> @@ -283,19 +283,44 @@ static int create_fd(struct fsnotify_group *group, const struct path *path,
>  	return client_fd;
>  }
>  
> +static int process_access_response_info(int fd, const char __user *info, size_t info_len,
> +					struct fanotify_response_info_audit_rule *friar)

I prefer to keep lines within 80 columns, unless there is really good
reason (like with strings) to have them longer.

BTW, why do you call the info structure 'friar'? I feel some language twist
escapes me ;)

> +{
> +	if (fd == FAN_NOFD)
> +		return -ENOENT;

I would not test 'fd' in this function at all. After all it is not part of
the response info structure and you do check it in
process_access_response() anyway.

> +
> +	if (info_len != sizeof(*friar))
> +		return -EINVAL;
> +
> +	if (copy_from_user(friar, info, sizeof(*friar)))
> +		return -EFAULT;
> +
> +	if (friar->hdr.type != FAN_RESPONSE_INFO_AUDIT_RULE)
> +		return -EINVAL;
> +	if (friar->hdr.pad != 0)
> +		return -EINVAL;
> +	if (friar->hdr.len != sizeof(*friar))
> +		return -EINVAL;
> +
> +	return info_len;
> +}
> +

...

> @@ -327,10 +359,18 @@ static int process_access_response(struct fsnotify_group *group,
>  		return -EINVAL;
>  	}
>  
> -	if (fd < 0)
> +	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
>  		return -EINVAL;
>  
> -	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> +	if (response & FAN_INFO) {
> +		ret = process_access_response_info(fd, info, info_len, &friar);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		ret = 0;
> +	}
> +
> +	if (fd < 0)
>  		return -EINVAL;

And here I'd do:

	if (fd == FAN_NOFD)
		return 0;
	if (fd < 0)
		return -EINVAL;

As we talked in previous revisions we'd specialcase FAN_NOFD to just verify
extra info is understood by the kernel so that application writing fanotify
responses has a way to check which information it can provide to the
kernel.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

