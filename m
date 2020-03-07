Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6B717CA41
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 02:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583544132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FujUDTOc7PQNJa+IQhYBMNxWNK0SWXdgoymOZSLOLOI=;
	b=RsIzVMBpgkAvR3wczR1Pp2hz3RuIwy9OVbuv7M0XNa9W1kVhpyGTbGdLvLQjATReS+r2pX
	i2Pf6KfDWZ/YMDndXuNG7/uWqUZZeQMIgq/KmKcXKxWRnSl/rSI4UGnrWiUwAGkAjYqtYz
	IuvSHZj2hTeT7INWZk5HW/xSuaW1sLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-DH0dCNGSPamMI8IrrK-baw-1; Fri, 06 Mar 2020 20:22:10 -0500
X-MC-Unique: DH0dCNGSPamMI8IrrK-baw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD7CD13F6;
	Sat,  7 Mar 2020 01:22:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519FD5D9CD;
	Sat,  7 Mar 2020 01:22:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B14084481;
	Sat,  7 Mar 2020 01:22:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0271LtYJ015335 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 20:21:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D6D42166B2B; Sat,  7 Mar 2020 01:21:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B3C2166B28
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 01:21:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAFC1185A78E
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 01:21:53 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-X6uQpKPVMkG2QT15IHrOJA-1; Fri, 06 Mar 2020 20:21:51 -0500
X-MC-Unique: X6uQpKPVMkG2QT15IHrOJA-1
Received: by mail-ed1-f67.google.com with SMTP id e25so4662118edq.5
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 17:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qLDYqd4/kBCYuBoU5oYwk4X7oDvS0U8ta6JolcDtoNw=;
	b=CDNfwlgjGvAEKw2jNEH0vTB8LFnEUlMAhYgRbzHkbwLFALnFmdqS9XQgMtKdTy6LhF
	xPcxLZzaWjcU7ItuOU0lqs5aX/hMZhHT7WtIC7IwseRAPlCpoqkerwCFCGWTv1X4anQQ
	av5zB3Wqf57xsKKF9ijXDaahKv6iSGn8N4hGFKb8BOiaDP3hOO/nkgsvO0VgBFYqdV3s
	wbBXmexiiKUr18RynMRhDh4RWabBfHlbGM2+uRfkJzRuQwD5Tgr4HBf5k3L0mFZeQjCv
	aAYtaH1R1beD0JEaDZekNqrhIGfxrQ80HNE/mpLZucvviC0BgqlkTB/tP7T3n1nyVLrw
	gq+w==
X-Gm-Message-State: ANhLgQ17eYhJXRHK40msQ2EvBfYjKC2NxK9h/qTFzqaRS/jAb+KQsgy+
	J/LjlO4Rd1EBYvpwP0snSSW+l1DINJYzl/yLoD2f
X-Google-Smtp-Source: ADFU+vuJmiN8rY58PLm/ER6NlhHnbjDLWWj4S+HEVRHY/lacHtW9exeEeon5376wqztPDSqA76OGxjPEj8AMdOzKyBc=
X-Received: by 2002:a17:906:52c9:: with SMTP id
	w9mr5541580ejn.70.1583544110257; 
	Fri, 06 Mar 2020 17:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-6-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-6-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 20:21:39 -0500
Message-ID: <CAHC9VhTkE2bK258NQsQuZeUJd1MO53HvWDsAbqPCAT+AvEBOMQ@mail.gmail.com>
Subject: Re: [PATCH v15 08/23] LSM: Use lsmblob in security_ipc_getsecid
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0271LtYJ015335
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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

On Fri, Feb 21, 2020 at 7:05 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> There may be more than one LSM that provides IPC data
> for auditing. Change security_ipc_getsecid() to fill in
> a lsmblob structure instead of the u32 secid. The
> audit data structure containing the secid will be updated
> later, so there is a bit of scaffolding here.

"updated later", that's better, thank you.  If I can go even a step
further, it would be really nice if you could provide a brief
explanation, a sentence or two is okay, on what you intended it to be
when it is done in this patchset/iteration.

> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h |  7 ++++---
>  kernel/auditsc.c         |  5 ++++-
>  security/security.c      | 12 +++++++++---
>  3 files changed, 17 insertions(+), 7 deletions(-)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

