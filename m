Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E57042D7976
	for <lists+linux-audit@lfdr.de>; Fri, 11 Dec 2020 16:33:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607700832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J5GMsLq/i9ZWfbUo+gzdxve4yniOUHdMDHjCXXgNOD8=;
	b=NRn37c1PnY4LdJRDAnAAj6KJzvMlQgxmwQ/wvpWTnTfyeVepSrErYnNB2WNlMXVS1Vfll9
	86OMZWgqZmgD9cJM/WCXpkhsnlf/UDOr9JdXJO64l+VgfD5jhp6BRvNDT60OPy0R9kMRpc
	mJ7Y6HZbSPPD2aO6IT1jGEbIzYaOiC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-vd2DP7BUMHiweL8mBJvbLg-1; Fri, 11 Dec 2020 10:33:49 -0500
X-MC-Unique: vd2DP7BUMHiweL8mBJvbLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79FC8A0CA3;
	Fri, 11 Dec 2020 15:33:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C780D5D731;
	Fri, 11 Dec 2020 15:33:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9FDC4A7C6;
	Fri, 11 Dec 2020 15:33:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BBFXU4r011706 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 10:33:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4AF31042A40; Fri, 11 Dec 2020 15:33:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B82E310023B2;
	Fri, 11 Dec 2020 15:33:23 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:33:21 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] kernel/audit: convert comma to semicolon
Message-ID: <20201211153321.GF2015948@madcap2.tricolour.ca>
References: <20201211084254.2038-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201211084254.2038-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-11 16:42, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  kernel/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 68cee3bc8cfe..c8497115be35 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2282,7 +2282,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
>  
>  	uid = from_kuid(&init_user_ns, task_uid(current));
>  	oldloginuid = from_kuid(&init_user_ns, koldloginuid);
> -	loginuid = from_kuid(&init_user_ns, kloginuid),
> +	loginuid = from_kuid(&init_user_ns, kloginuid);

Nice catch.  That went unnoticed through 3 patches, the last two mine...
Not quite sure why no compiler complained about it...

Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

>  	tty = audit_get_tty();
>  
>  	audit_log_format(ab, "pid=%d uid=%u", task_tgid_nr(current), uid);

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

