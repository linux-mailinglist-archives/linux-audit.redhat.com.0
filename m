Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D01271C1A87
	for <lists+linux-audit@lfdr.de>; Fri,  1 May 2020 18:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588350362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pT1cTeWJ9+NmO+902WQ2/TdqhPLk7sGd0/pU0NMwChI=;
	b=OguN0wJfE9VcIEfir2nWLAojtqnDO+E5IuIXL4R/f2tUzNdmP67rMqlifUtnAwQMfDEyzo
	d3XsCXTr53D9fTK4hK4vtaadFRBiff2yxFbh3XHdAArRbRjehi5z1enknaZYkk0ySW8wXM
	oMR5KYg0sdUaMUlchSLSEsKRzCYelC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-8y7GXM8bOG2ktvoB467mDg-1; Fri, 01 May 2020 12:25:59 -0400
X-MC-Unique: 8y7GXM8bOG2ktvoB467mDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE9B1030C20;
	Fri,  1 May 2020 16:25:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E5595EE15;
	Fri,  1 May 2020 16:25:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C66FF1809540;
	Fri,  1 May 2020 16:25:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 041GPls0006511 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 May 2020 12:25:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46E57105543D; Fri,  1 May 2020 16:25:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CE11055423
	for <linux-audit@redhat.com>; Fri,  1 May 2020 16:25:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA31E1097AC9
	for <linux-audit@redhat.com>; Fri,  1 May 2020 16:25:43 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-UKk1fw5RNQW9NxfUJ-eijQ-1; Fri, 01 May 2020 12:25:39 -0400
X-MC-Unique: UKk1fw5RNQW9NxfUJ-eijQ-1
Received: by mail-ed1-f67.google.com with SMTP id f12so7610230edn.12
	for <linux-audit@redhat.com>; Fri, 01 May 2020 09:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hw9/wydDlBqAyYMFqIYueE2Wa0Mp6OJgMTQVjLv20B4=;
	b=d4/OC/JAAEj4J0hOaEslku0h3F3f5W7Xd/iNHL/cezhUvl1zgc/NOxoqsVbwOcynTf
	Yfl3f1bYl76P89QkY/42TI4Ci93iP/sWUlMkq+24qcKQW6YBbzBfQguM1s3GjhC2+y2G
	OfaTV4JZo/fDVttolwn5CYNccCZ2238FohtrswIEEJ6FFCAS8O2wxSgJj8vFAI1i7mGM
	0IIv8fBVPQNGQTPlBoYxsMqUxhYPxcPnlu5bYs/G3rGeHIjMgvc6mzN7SFcEq7vGYgX/
	IqjrU4mZfNNp4hsGnffBZqA0P+v4ypFa/CfTJm+u0LN71VCUnxDMNtrqSRvBQTxXHIP/
	Wq+A==
X-Gm-Message-State: AGi0PuYliLLmv9kMC2KJd+qyHAl8ddPZZGoudnWzdDGUWyRX0thDMBmI
	szjD6KotJWP+8o5+4jfmyzSttSQfvyeEEpMqTnDfLi8=
X-Google-Smtp-Source: APiQypKYRGiTGQ2zObjjK8lUl5uklzwodbbZGfkcMDfGKEDc1toRqXuMDf7JgWcGjU1EIXRi//8cZzYIFKdI3xUFr1g=
X-Received: by 2002:aa7:c401:: with SMTP id j1mr4173941edq.31.1588350337960;
	Fri, 01 May 2020 09:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200429092648.63945-1-zhengbin13@huawei.com>
In-Reply-To: <20200429092648.63945-1-zhengbin13@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 May 2020 12:25:26 -0400
Message-ID: <CAHC9VhSyLY4gEE5i-UwVC78n1XXQgPyCaEG5H1SvtHF1admNoA@mail.gmail.com>
Subject: Re: [PATCH] audit: make symbol 'audit_nfcfgs' static
To: Zheng Bin <zhengbin13@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 041GPls0006511
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 29, 2020 at 5:19 AM Zheng Bin <zhengbin13@huawei.com> wrote:
>
> Fix sparse warnings:
>
> kernel/auditsc.c:138:32: warning: symbol 'audit_nfcfgs' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
>  kernel/auditsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into audit/next, thank you.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

