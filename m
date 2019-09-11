Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F0B052A
	for <lists+linux-audit@lfdr.de>; Wed, 11 Sep 2019 23:19:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 593551DA3;
	Wed, 11 Sep 2019 21:19:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E981C60BEC;
	Wed, 11 Sep 2019 21:19:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1570A180221D;
	Wed, 11 Sep 2019 21:19:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BLJ3bl027687 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 17:19:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D634560C05; Wed, 11 Sep 2019 21:19:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-12.phx2.redhat.com [10.3.117.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBCA60C5E;
	Wed, 11 Sep 2019 21:19:00 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: When is EOE generated?
Date: Wed, 11 Sep 2019 17:19:00 -0400
Message-ID: <15531009.1YdTc8d0Yq@x2>
Organization: Red Hat
In-Reply-To: <bd4b2f99-89a0-4d59-aeb9-a97be31b0445@www.fastmail.com>
References: <bd4b2f99-89a0-4d59-aeb9-a97be31b0445@www.fastmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
	Giovanni Panepinto <gpanepinto@fastmail.fm>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Wed, 11 Sep 2019 21:19:23 +0000 (UTC)

Hello,

On Tuesday, September 10, 2019 11:55:58 PM EDT Giovanni Panepinto wrote:
> According to
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/h
> tml/security_guide/sec-audit_record_types , the record EOE gets generated
> to represent "the end of a multi-record event."
> 
> In my audit logs, I can see that for some events, EOE doesn't get
> generated.

<snip>

> So my question is, what defines a multi-record event? And why is EOE not
> generated when I create a file under /usr/local/bin?

The EOE record is stripped by the audit daemon to save disk space. The audit 
libraries and utilities use heuristics to determine the end of an event. So, 
if you are parsing events with auparse, it will figure out the end of the 
event and group all related records for you. The EOE record is passes along 
to the real time interface just in case it helps to mark an event complete 
before the heuristics determine it is complete.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
