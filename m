Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A08FF145E04
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C2PBxid4jWMMcaWBMAdrSGv6tPiHoUaGJLs6JYcbskU=;
	b=cApZqkjU/42PMGTEd5/h515BIhRT1dByLIbsy4d9k+GTMibIA+6bJHDNva24bw6QFKghVj
	0zBJc2iVqUWO+DXwMY3YuaTCv59bW8R1Etq0tm42eN7EBAxczIaken4tGRPK94BMPtaiRM
	IX4M2pNax5bTaM0ism/RswZ2fjXtpyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-IEFhEtNIP9asvnoR7YAO-A-1; Wed, 22 Jan 2020 16:29:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A844218B9FC1;
	Wed, 22 Jan 2020 21:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83752860EB;
	Wed, 22 Jan 2020 21:29:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4764F870B4;
	Wed, 22 Jan 2020 21:29:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLTdwD003668 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:29:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 40A8CF89EF; Wed, 22 Jan 2020 21:29:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CBFDF4D31
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75CF118AE968
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:37 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-1UnmdKHAN7OQNOwwVS2KrA-1; Wed, 22 Jan 2020 16:29:35 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so708230lfq.10
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T8dyZsx/1G1o4Km+D3AEjaFYjcDXoKwu76FXwqPPMog=;
	b=ViyNoIYcWwHC6M2uSWTivgsf7I2rOEOo5e3RZcVQ6atcyEnlYNbwvZ/zlzt1eFkrqT
	Juy4qLcs+zZSpi5DW65VfHf3bc/aPvaFse+CybumNOIFTg+8zi6eiYOI6gCMQj+NFCG9
	myUhqr4UOX9S1ott4dMVtQ1vNvWgBoAb0mIgCOWbv4XWqIBLCMdZNTabKUbckHFD4o4l
	WnDc8CSdLTu6cvj9/vesDZD6daW42S0q6yaHtENBxUddOqgmfNHtYHvURxdzMGuBjowV
	VPN3/AtIwQfV5YmHX/BPDZa2tML1/ea9jtkr30OiyAHcKofvBpiOkUR5/vAsF0EPQnXJ
	j9IQ==
X-Gm-Message-State: APjAAAW1aCAaVBDr3l0p1w0gSH1hzHaLI2W4rR2kd9r5LEBghjfQzWST
	ZMO3IZUMCiYLeTOMddMtegBwdQWUk2l4TAq5Qjq6
X-Google-Smtp-Source: APXvYqz71TZIg9MpEPSBX37Fh9pYf3NdlS4RNWJNnf5mBSZhvbWQtLxCouQ51G9Z/+VOzq252Xo+mwvfcQY+/hQ0B1U=
X-Received: by 2002:ac2:4422:: with SMTP id w2mr2853088lfl.178.1579728573496; 
	Wed, 22 Jan 2020 13:29:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<28cf3e16f8440bcb852767d3ae13e1a56c19569c.1577736799.git.rgb@redhat.com>
In-Reply-To: <28cf3e16f8440bcb852767d3ae13e1a56c19569c.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:29:22 -0500
Message-ID: <CAHC9VhS5snVdRJ95ymCb0oX7dhM_6A5rdtKSRm4fo1xi0hA4NQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 14/16] audit: check contid depth and add limit
	config param
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: 1UnmdKHAN7OQNOwwVS2KrA-1
X-MC-Unique: IEFhEtNIP9asvnoR7YAO-A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLTdwD003668
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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

On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Clamp the depth of audit container identifier nesting to limit the
> netlink and disk bandwidth used and to prevent losing information from
> record text size overflow in the contid field.
>
> Add a configuration parameter AUDIT_STATUS_CONTID_DEPTH_LIMIT (0x80) to
> set the audit container identifier depth limit.  This can be used to
> prevent overflow of the contid field in CONTAINER_OP and CONTAINER_ID
> messages, losing information, and to limit bandwidth used by these
> messages.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/uapi/linux/audit.h |  2 ++
>  kernel/audit.c             | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  kernel/audit.h             |  2 ++
>  3 files changed, 50 insertions(+)

Since setting an audit container ID, and hence acting as an
orchestrator and creating a new nested level of audit container IDs,
is a privileged operation I think we can equate this to the infamous
"shooting oneself in the foot" problem.  Let's leave this limitation
out of the patchset for now, if it becomes a problem in the future we
can consider restricting the nesting depth.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

