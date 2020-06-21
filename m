Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4E6202C04
	for <lists+linux-audit@lfdr.de>; Sun, 21 Jun 2020 20:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592764762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L3z2O2Isn7b0+vAPhFazENk/jkrYEMB+RljxYTlCIL4=;
	b=Fz50f7jCGosBKAwKVOWRlIjfbWF4lmK/mI8xyJ5Gm78h/OH58kVqiyXaXNKuSyY6Q5QjM9
	6WETBhsQzyl/X2yQNoYh7PP1JATKBsq+Lg2TadmJBQPp/efy11/Y6uMutu4HFmkUGwc5pG
	Jh6iDHeZliVJji4DSw3FkOEfJ6LVZKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-NGoVQfrBMviA3vtBjaR7Hg-1; Sun, 21 Jun 2020 14:39:20 -0400
X-MC-Unique: NGoVQfrBMviA3vtBjaR7Hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC70E464;
	Sun, 21 Jun 2020 18:39:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7423F10013C2;
	Sun, 21 Jun 2020 18:39:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0909833B1;
	Sun, 21 Jun 2020 18:38:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05LIchna005200 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 21 Jun 2020 14:38:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4107460C87; Sun, 21 Jun 2020 18:38:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-97.phx2.redhat.com [10.3.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F317960BF1;
	Sun, 21 Jun 2020 18:38:40 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Error handling of auditctl -w
Date: Sun, 21 Jun 2020 14:38:39 -0400
Message-ID: <3816311.bfVM1qvdfx@x2>
Organization: Red Hat
In-Reply-To: <1MXp9Y-1jOF6E24IW-00Y8HI@mail.gmx.com>
References: <1MXp9Y-1jOF6E24IW-00Y8HI@mail.gmx.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Stefan Tauner <stefan.tauner@gmx.at>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Tuesday, June 16, 2020 4:00:17 PM EDT Stefan Tauner wrote:
> I was wondering why my auditctl executions do not print any errors but
> apparently didn't do anything. After checking the return value (which
> was 255) I looked at the code and noticed that audit_setup_perms() and
> audit_update_watch_perms() have virtually no user-visible error reporting.

Git commit 4a2b9fd should fix this. Thanks for reporting it!

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

