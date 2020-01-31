Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7254514E770
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iLTCL5mFXCEygH9Ofq77LQ5j42XzhgqgL2OG2g39mZ4=;
	b=fdZrzS5ld95mQQ/mjBUsr2vcd8pzB8bMEgiXQyDlHKhDAQXUPS3dfnooHNC/2ONmQbvGWk
	6SmmTOHt8koQwG3ucxI3Eyrjuk0+InKF3E8lOH46yNcNgdvyCtxUS6qwHGeznyg44Ha1fY
	+H6+uqVyh05Wn4797rR4NKqzIfjIykM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-GPhg8WUhNJirG7atnLF8zg-1; Thu, 30 Jan 2020 22:18:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D64271083012;
	Fri, 31 Jan 2020 03:18:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8905DA75;
	Fri, 31 Jan 2020 03:18:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 296AC18089CF;
	Fri, 31 Jan 2020 03:18:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3Hl8Y019762 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:17:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28C002033955; Fri, 31 Jan 2020 03:17:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2392B2093CE3
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:17:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1F7C1011A09
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:17:44 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-riaZgxVHOUaj9h_n4HEhYg-1; Thu, 30 Jan 2020 22:17:43 -0500
Received: by mail-ed1-f65.google.com with SMTP id g19so6193118eds.11
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oIg4izJ3dY0xBGHn3X1cuTzljmHGk0vFwMx8ad4w19E=;
	b=CJW4r9v6aUOEjGBfXUmBof9CZeqry8wObcXhBDel+9PyC+yK0I0pQC8nB3H815mddM
	VI8KbB5os/9yFDxrXclDqpUqzb0JpZ8c2zGomsCEBzH2S8PLDl1KNFPh1gSJXzeJ6LUd
	vcYPm2FuFtTLVJLFwG15evUoYmgtKEm97nC2zTH1Q6G9C3yj3cE53xyIc+TaXuuuJDR6
	IR+/0QOS2fAMo7xlbEbQq4RwhonIikazniE0PPgJWw/QvIrI2vslnfzJPZahwILrvBK5
	quKYPAj97e26Pd/MKKOn4XJKUwrm1FCBh64KIR2f3Mi8cYv1NZh9OZXxGGkExptu2f5F
	hUQQ==
X-Gm-Message-State: APjAAAXBBy3DqhgpZkrSbAaHJs2cC/vJFwKDfBlIT1kiOgDCHhm2zdCg
	8bhquT+hN9H29EJs9kK1X7Mjnvl4OUxm6ve8kExs
X-Google-Smtp-Source: APXvYqzzdWfnLzyByQcFVGmQCzqJhEsT1dBRVturw9d61zDsL2ZmJkMBe/HXMeV5fccEH2eEGkyfWfY/Ux/vDgbn3ec=
X-Received: by 2002:a17:906:9352:: with SMTP id
	p18mr6813461ejw.95.1580440661314; 
	Thu, 30 Jan 2020 19:17:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
In-Reply-To: <194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:17:30 -0500
Message-ID: <CAHC9VhT9T-UMnu6bWdd733XB6QaP+Sm3KWhdy828RN_FVWBMmw@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 1/9] netfilter: normalize x_table function
	declarations
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: riaZgxVHOUaj9h_n4HEhYg-1
X-MC-Unique: GPhg8WUhNJirG7atnLF8zg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3Hl8Y019762
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 1:54 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Git context diffs were being produced with unhelpful declaration types
> in the place of function names to help identify the funciton in which
                                                      ^^^^^^^^
                                                      function
> changes were made.
>
> Normalize x_table function declarations so that git context diff
> function labels work as expected.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  net/netfilter/x_tables.c | 43 ++++++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 25 deletions(-)

Considering that this patch is a style change in code outside of
audit, and we want to merge this via the audit tree, I think it is
best if you drop the style changes from this patchset.  You can always
submit them later to the netfilter developers.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

