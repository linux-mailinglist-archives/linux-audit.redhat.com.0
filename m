Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCBC167F53
	for <lists+linux-audit@lfdr.de>; Fri, 21 Feb 2020 14:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582293250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ijE/f7/X3Oe+jlg4CTpJFG1dZSNO6aXkx0UEiKlPMQg=;
	b=IeTzZe7lX/rq20p9ju8EFsFnv2Op/VjYOZJNbNwhJX7h34vkaKfgHTjH0Ayzxw78g8HAUX
	zc19opgOFGqKZNsBqui5GxX70jAKiXPpsv7IGyFpANAPB6cnIvK98ZYPrvLebGNcDu5q25
	kvO/sdb0TTGzINkRQHjAbnIWRAAs+Uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-hEknwTHaNLSeOnjdLXHyxw-1; Fri, 21 Feb 2020 08:54:08 -0500
X-MC-Unique: hEknwTHaNLSeOnjdLXHyxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73349107ACCC;
	Fri, 21 Feb 2020 13:54:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A51EA5D9E2;
	Fri, 21 Feb 2020 13:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D28501832DA3;
	Fri, 21 Feb 2020 13:53:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LDrd53032751 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 08:53:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 86E4090F71; Fri, 21 Feb 2020 13:53:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-45.phx2.redhat.com [10.3.117.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9467D90F69;
	Fri, 21 Feb 2020 13:53:36 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Moshe Rechtman <mrechtma@redhat.com>
Subject: Re: Question about excluding rules
Date: Fri, 21 Feb 2020 08:53:35 -0500
Message-ID: <2890955.nCKnN53pJf@x2>
Organization: Red Hat
In-Reply-To: <CAM5ObRErKLEDB_2RAWBf_Xp+V+aEdBQhi_dnicM9o2Q7SK_y2g@mail.gmail.com>
References: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
	<3341724.7X2qyikPX2@x2>
	<CAM5ObRErKLEDB_2RAWBf_Xp+V+aEdBQhi_dnicM9o2Q7SK_y2g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, February 21, 2020 2:32:58 AM EST Moshe Rechtman wrote:
> Thanks so much for your help! I've included your suggested filter in
> audit.rules as shown below:
> 
> # cat audit.rules1
> 
>       1 # This file contains the auditctl rules that are loaded
>       2 # whenever the audit daemon is started via the initscripts.
>       3 # The rules are simply the parameters that would be passed
>       4 # to auditctl.
>       5 # First rule - delete all
>       6 -D
>       7 # Increase the buffers to survive stress events.
>       8 # Make this bigger for busy systems
>       9 -b 320
>      10 ### Feel free to add below this line. See auditctl man page
>      11 -a exit,always -F arch=b64 -F euid=0 -S execve -k rootact
>      12 -a exit,always -F arch=b32 -F euid=0 -S execve -k rootact
>      13 -a exit,always -F arch=b64 -F euid>=500 -S execve -k useract
>      14 -a exit,always -F arch=b32 -F euid>=500 -S execve -k useract
>      15 -a exit,always -F arch=b64 -F euid=0 -F auid!=unset -S execve -k
> rootact
>      16 -a exit,always -F arch=b32 -F euid=0 -F auid!=unset -S execve -k
> rootact

It won't work this way. You now have 2 sets of rootact. The audit rule engine 
is a first match wins. So, this second set of rules will never trigger. The 
rule I mentioned was supposed to replace the rule in the list.

> After restarting the auditd service following error received:
> 
> # service auditd restart
> Stopping auditd:                                           [  OK  ]
> Starting auditd:                                           [  OK  ]
> Unknown user: unset
> -F unknown field: auid

OK. I guess this is really old. Then make it auid=-1

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

