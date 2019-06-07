Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23A3954B
	for <lists+linux-audit@lfdr.de>; Fri,  7 Jun 2019 21:09:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB45630832E4;
	Fri,  7 Jun 2019 19:08:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65B355FCAB;
	Fri,  7 Jun 2019 19:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94F131806B16;
	Fri,  7 Jun 2019 19:08:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57J78cF013761 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 15:07:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E74FB7856D; Fri,  7 Jun 2019 19:07:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-181.rdu2.redhat.com [10.10.122.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B34187855E
	for <linux-audit@redhat.com>; Fri,  7 Jun 2019 19:07:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Alpha and IA64 processors
Date: Fri, 07 Jun 2019 15:07:01 -0400
Message-ID: <3954841.mGIAQ9ooKE@x2>
Organization: Red Hat
In-Reply-To: <2537646.fg0DhgGk2c@x2>
References: <2537646.fg0DhgGk2c@x2>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 07 Jun 2019 19:09:14 +0000 (UTC)

Hello,

On Friday, May 17, 2019 2:38:25 PM EDT Steve Grubb wrote:
> Are there any objections to dropping support for the Alpha and IA64
> processors in the master branch of audit user space? I would like to reduce
> the maintenance burden and if noone is using these, I'll delete them on
> May 24.

This is to note that support for these processors have been deprecated on the 
master branch. They are still in the 2.8 maintenance branch. If any 
distribution would like to continue support, the commits that drop each are 
the following:

Alpha:
https://github.com/linux-audit/audit-userspace/commit/
969a2c5df1577b6d92062a02045a01752cd4733c

IA64:
https://github.com/linux-audit/audit-userspace/commit/
de35e6f18212e03e9ca57124ce5362c26aae22a2


-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
