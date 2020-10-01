Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 926E027FEDC
	for <lists+linux-audit@lfdr.de>; Thu,  1 Oct 2020 14:19:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-KF6ZUD7SM3aaYV7IGXm29A-1; Thu, 01 Oct 2020 08:18:58 -0400
X-MC-Unique: KF6ZUD7SM3aaYV7IGXm29A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABA5580EF9D;
	Thu,  1 Oct 2020 12:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4846260BF1;
	Thu,  1 Oct 2020 12:18:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FC3544A44;
	Thu,  1 Oct 2020 12:18:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091A3u1p026768 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 06:03:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D99C82166B27; Thu,  1 Oct 2020 10:03:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4B3A2166BA2
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 10:03:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC1AE101A540
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 10:03:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-287-1GQ1bE6NOE2lBbqdSEwPgw-1;
	Thu, 01 Oct 2020 06:03:51 -0400
X-MC-Unique: 1GQ1bE6NOE2lBbqdSEwPgw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7323BB19E;
	Thu,  1 Oct 2020 09:49:39 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 147E91E12EF; Thu,  1 Oct 2020 11:49:39 +0200 (CEST)
Date: Thu, 1 Oct 2020 11:49:39 +0200
From: Jan Kara <jack@suse.cz>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH 1/3] fanotify: Ensure consistent variable type for response
Message-ID: <20201001094939.GD17860@quack2.suse.cz>
References: <12617626.uLZWGnKmhe@x2>
MIME-Version: 1.0
In-Reply-To: <12617626.uLZWGnKmhe@x2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed 30-09-20 12:12:24, Steve Grubb wrote:
> The user space API for the response variable is __u32. This patch makes
> sure that the whole path through the kernel uses __u32 so that there is
> no sign extension or truncation of the user space response.
> 
> Signed-off-by: Steve Grubb <sgrubb@redhat.com>
> ---
>  fs/notify/fanotify/fanotify.h      | 2 +-
>  fs/notify/fanotify/fanotify_user.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Looks good, just one nit below:

> diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
> index 63b5dffdca9e..c8da9ea1e76e 100644
> --- a/fs/notify/fanotify/fanotify_user.c
> +++ b/fs/notify/fanotify/fanotify_user.c
> @@ -157,7 +157,7 @@ static int create_fd(struct fsnotify_group *group, struct path *path,
>   */
>  static void finish_permission_event(struct fsnotify_group *group,
>  				    struct fanotify_perm_event *event,
> -				    unsigned int response)
> +				    __u32 response)
>  				    __releases(&group->notification_lock)
>  {
>  	bool destroy = false;
> @@ -178,7 +178,7 @@ static int process_access_response(struct fsnotify_group *group,
>  {
>  	struct fanotify_perm_event *event;
>  	int fd = response_struct->fd;
> -	int response = response_struct->response;
> +	__u32 response = response_struct->response;
>  
>  	pr_debug("%s: group=%p fd=%d response=%d\n", __func__, group,
>  		 fd, response);

You want to print the response with "%u" here I guess...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

