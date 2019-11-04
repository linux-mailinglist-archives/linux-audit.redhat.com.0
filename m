Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A25AEE992
	for <lists+linux-audit@lfdr.de>; Mon,  4 Nov 2019 21:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572899584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vot0I8JTEGjiXRhifqj1v4BnEM/mdvtzBQrEDYSg4DM=;
	b=ChsZrLtzH/7KgGhwW1Tx9R+xCanX7UxjQxhHQZCsvqbSBWSaVBhC4u1L1in7FtDknp05DL
	lPnOrLbFueCHGSM8tD+nwpgikbeOepYesKAVQbfbw7N7XDt1bNbUTKitP+9AJ+DAe+fx2v
	HrBiDMuMUPbA8Y4tRr4COP0tHTjgbS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-I36eGNzgPNeoQ2vgoKgr9g-1; Mon, 04 Nov 2019 15:33:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F221800D53;
	Mon,  4 Nov 2019 20:32:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9793C60874;
	Mon,  4 Nov 2019 20:32:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DA784BB65;
	Mon,  4 Nov 2019 20:32:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4KWS9D008545 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 15:32:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 118701A8D9; Mon,  4 Nov 2019 20:32:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-33.phx2.redhat.com [10.3.117.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF6DE3D8C
	for <linux-audit@redhat.com>; Mon,  4 Nov 2019 20:32:24 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Audit-3.0 alpha9 available
Date: Mon, 04 Nov 2019 15:32:24 -0500
Message-ID: <1641615.nusK7hyVmH@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: I36eGNzgPNeoQ2vgoKgr9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

This is to let everyone know that another audit-3.0 pre-release was made.=
=20
This rolls up a lot more fixes in the master branch since the last pre-rele=
ase=20
was announced. Despite the designation of alpha, I feel that this is a=20
production quality release and can be treated that way. It has been pushed=
=20
into all supported releases of Fedora to indicate that I feel it's a good=
=20
release with significant fixes/features that people would want.  The releas=
e is=20
based off of the tree as of commit 1c2f876.

You can find the release here:
http://people.redhat.com/sgrubb/audit/audit-3.0-alpha9.tar.gz

Changelog is here:
https://github.com/linux-audit/audit-userspace/blob/
1c2f876512dee3450230a9d79743e9fa01c2eb19/ChangeLog

* One thing to note to distro packagers. The location where the shipped rul=
es=20
are installed to has changed. Previously they went into an area that is=20
associated with documentation. Now the location is /usr/share/audit/sample-
rules/

The reason this has not been declared a stable 3.0 release is simply becaus=
e=20
we are still waiting for container support to land. In any event, if you fi=
nd=20
any problems with this "release", please email this list or file an issue i=
n=20
github.

Thanks,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

