Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDFAE4302
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 07:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571982259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CXNOIrFXavwYaY3BqSXPjt3nv7iTK26tOhKLFCE1+fQ=;
	b=XTynaF13sLuywNt63ZVijUcHNkco3QDZYMqFcoP84EA1McPXUQATyPjCqp+yRj3TxQCug0
	zMFmdj04JDnP2ga/YRISWj+Ks2JoEuH3XRDWxk9Dv4YKLZ6zWbkV4oyrtpk3alxC7LmEtb
	qQ6F9MmE7tjRBen5LivKkxvo8QRfraI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-jp1qwRmdOI-UyDsp5_PZZQ-1; Fri, 25 Oct 2019 01:44:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA528800D41;
	Fri, 25 Oct 2019 05:44:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 322585DAAF;
	Fri, 25 Oct 2019 05:44:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B04B31800B74;
	Fri, 25 Oct 2019 05:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9P5hnkl010889 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 01:43:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DEFE5C223; Fri, 25 Oct 2019 05:43:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08C505C219
	for <linux-audit@redhat.com>; Fri, 25 Oct 2019 05:43:46 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01BEB4E8AC
	for <linux-audit@redhat.com>; Fri, 25 Oct 2019 05:43:43 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id w140so411635ywd.0
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 22:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
	:references:user-agent:subject:mime-version
	:content-transfer-encoding;
	bh=Fd7RXxRWJ4J0hJ0jyxPd09lzue/aYzfNqk8tuCDAACY=;
	b=eu0aGbiF636BldNNxrTT7B1olIfyXx1aTM02t+8kSIs6UxsUpxKyVqbNEbcKvLHo3F
	0iFCySgGE3+E/7lc27yzUMeftRA+Hy6YJ1EUH1UETPmCe3TzeFrt5sU7RXEIdhq1yPoo
	Xs9EWblQISbEtq2YIEPaE0fUaG+h+F1tLK0MbeuncjL7l4mpxMjLlHBIv49ZnXeXtHan
	T3E4Kh/+uSqvYcn3rjWBhpczcuv+vR2pGwu5XZGdynKhW3lNzWR5JzFtEyeJfwfrYT9a
	ckL5x4jmgbc44VrPbs75sBIZxFpgZezH/QlUlkKGq+9NJNz0zbyed4/fdWd6/MpToEVO
	p+xg==
X-Gm-Message-State: APjAAAVhDC5zEtahFKejLb7JCcIeKZp1km2bDUSNAlYZDCQRNCsevLQZ
	ghTorJ6Hjj3MwnkWROBfgP6FAAHwDErf
X-Google-Smtp-Source: APXvYqz6j70rhPDk97kDk5M2WocFgZjOherEcRWqCGj1FuQC2lgG1k6GJ9/b7lbdUpwhgu7FyDmgFg==
X-Received: by 2002:a81:5749:: with SMTP id l70mr848949ywb.488.1571982221892; 
	Thu, 24 Oct 2019 22:43:41 -0700 (PDT)
Received: from [172.31.99.25] ([212.147.57.94])
	by smtp.gmail.com with ESMTPSA id
	l188sm359126ywl.29.2019.10.24.22.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Oct 2019 22:43:40 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: Yunfeng Ye <yeyunfeng@huawei.com>, <eparis@redhat.com>
Date: Fri, 25 Oct 2019 07:43:37 +0200
Message-ID: <16e0170d878.280e.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <7869bb43-5cb1-270a-07d1-31574595e13e@huawei.com>
References: <7869bb43-5cb1-270a-07d1-31574595e13e@huawei.com>
User-Agent: AquaMail/1.20.0-1469 (build: 102100004)
Subject: Re: [PATCH] audit: remove redundant condition check in
	kauditd_thread()
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 25 Oct 2019 05:43:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 25 Oct 2019 05:43:43 +0000 (UTC) for IP:'209.85.161.68'
	DOMAIN:'mail-yw1-f68.google.com' HELO:'mail-yw1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.161.68 mail-yw1-f68.google.com 209.85.161.68
	mail-yw1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9P5hnkl010889
X-loop: linux-audit@redhat.com
Cc: hushiyuan@huawei.com, linfeilong@huawei.com, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-MC-Unique: jp1qwRmdOI-UyDsp5_PZZQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On October 23, 2019 3:27:50 PM Yunfeng Ye <yeyunfeng@huawei.com> wrote:
> Warning is found by the code analysis tool:
>  "the condition 'if(ac && rc < 0)' is redundant: ac"
>
>
> The @ac variable has been checked before. It can't be a null pointer
> here, so remove the redundant condition check.
>
>
> Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
> ---
> kernel/audit.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Hello,

Thank you for the patch.  Looking quickly at it, it appears to be correct, unfortunately I'm not in a position to merge non-critical patches, but I expect to merge this next week.


> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..193f3a1f4425 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -830,7 +830,7 @@ static int kauditd_thread(void *dummy)
>  rc = kauditd_send_queue(sk, portid,
>  &audit_hold_queue, UNICAST_RETRIES,
>  NULL, kauditd_rehold_skb);
> - if (ac && rc < 0) {
> + if (rc < 0) {
>  sk = NULL;
>  auditd_reset(ac);
>  goto main_queue;
> @@ -840,7 +840,7 @@ static int kauditd_thread(void *dummy)
>  rc = kauditd_send_queue(sk, portid,
>  &audit_retry_queue, UNICAST_RETRIES,
>  NULL, kauditd_hold_skb);
> - if (ac && rc < 0) {
> + if (rc < 0) {
>  sk = NULL;
>  auditd_reset(ac);
>  goto main_queue;
> --
> 2.7.4.3

--
paul moore
www.paul-moore.com





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

