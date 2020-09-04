Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF8F25DE02
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 17:42:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-CkRGrRBTMHKNHXTXqKlFig-1; Fri, 04 Sep 2020 11:42:42 -0400
X-MC-Unique: CkRGrRBTMHKNHXTXqKlFig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C5B84635B;
	Fri,  4 Sep 2020 15:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DAC47FCF7;
	Fri,  4 Sep 2020 15:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A93CF18561B2;
	Fri,  4 Sep 2020 15:42:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084FgI0S019467 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 11:42:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C8EB10013D7; Fri,  4 Sep 2020 15:42:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-61.phx2.redhat.com [10.3.113.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CF7310013BD;
	Fri,  4 Sep 2020 15:42:14 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Security Auditd Config for Enterprises
Date: Fri, 04 Sep 2020 11:41:50 -0400
Message-ID: <2114738.iZASKD2KPV@x2>
Organization: Red Hat
In-Reply-To: <CAHvE9BK5+oRZrUCOkJ+Ong8z-R2ZVOmi-CZfddXJboRqWOGRkA@mail.gmail.com>
References: <CAHvE9BK5+oRZrUCOkJ+Ong8z-R2ZVOmi-CZfddXJboRqWOGRkA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Friday, September 4, 2020 9:38:33 AM EDT Rohit Nambiar wrote:
> Apologies if this topic has already been discussed before, I couldn't find
> an easy way to sift through older archives.
> 
> Is there an auditd rule set which offers a reasonable level of security
> visibility and has been tested on enterprise production systems? And if
> such a rule set can be shared here?
> 
> I'm looking for a base document to deploy/modify for use within my
> organization. Many thanks in advance.

The audit system ships a set of pre-written rules for various scenarios. It 
should be a matter of locating them over in /usr/share and copying them to 
/etc/audit/rules.d/

The rules that I would recommend are the OSPP rules. They form the basis of 
the STIG auditing requirements. And I believe CIS's guidance would have 
similar rules. That means you would copy the following files (you can also get 
these from github if they are not on your system):

10-base-config.rules
11-loginuid.rules
30-ospp-v42-1-create-failed.rules
30-ospp-v42-2-modify-failed.rules
30-ospp-v42-3-access-failed.rules
30-ospp-v42-4-delete-failed.rules
30-ospp-v42-5-perm-change-failed.rules
30-ospp-v42-6-owner-change-failed.rules
43-module-load.rules

The above is designed tro detect violations of the security policy. Meaning 
someone trying to access something they do not have permissions for. If you 
also need to audit successful events, then copy the corresponging success 
rules. However, when you capture all success events, then system update will 
be a high volume of events.

HTH,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

