Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDB9122E79
	for <lists+linux-audit@lfdr.de>; Tue, 17 Dec 2019 15:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576592471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eTzyJwDK+i9cu047qDHsLkrxh+6eryr3hw6yjZOK6Y8=;
	b=S1PiwRylk+hHafTbaCIdiXKKgHUR1jYRmphvytsd40Hg4NLvPQfxTpzmqR8p1wWd+y1mme
	DNGlKfDi8r0T5NIJEL6G0s4IuHDNhmjeCAktw84F/tGxPGgcmufUZUbshgZZZuuhsWN/fo
	cTBMDc6tMyZM7+7Bion4FyAp8W/lPBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-1PYkGaTuMHmCTM9gm8qf2A-1; Tue, 17 Dec 2019 09:21:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F182107ACC5;
	Tue, 17 Dec 2019 14:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DDB27C82C;
	Tue, 17 Dec 2019 14:21:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B89161803C33;
	Tue, 17 Dec 2019 14:20:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBHEKjNr025921 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Dec 2019 09:20:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 40CE97C830; Tue, 17 Dec 2019 14:20:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-249.phx2.redhat.com [10.3.116.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D253A7C82C;
	Tue, 17 Dec 2019 14:20:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Matching SSHD information in audit logs
Date: Tue, 17 Dec 2019 09:20:41 -0500
Message-ID: <2177815.HFh0nK17a1@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429822CB57@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429822CB57@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-MC-Unique: 1PYkGaTuMHmCTM9gm8qf2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, December 17, 2019 5:57:53 AM EST MAUPERTUIS, PHILIPPE wrote:
> Hi,
> When setting the SSHD log level to verbose as recommended by the CIS, I get
> the following in the secure log : Dec 17 11:32:29 myserver sshd[8456]:
> Connection from xx.xx.xx.xx port 44090 on xx.xx.xx.xx port 22 Dec 17
> 11:32:30 myserver sshd[8456]: Accepted key RSA SHA256: qhpzQKKbwaX8 found
> at /usr/bin/sss_ssh_authorizedkeys:1 Dec 17 11:32:30 myserver sshd[8456]:
> Postponed publickey for myuser from xx.xx.xx.xx port 44090 ssh2 [preauth]
> Dec 17 11:32:30 myserver sshd[8456]: Accepted key RSA SHA256: qhpzQKKbwaX8
> found at /usr/bin/sss_ssh_authorizedkeys:1 Dec 17 11:32:30 myserver
> sshd[8456]: Accepted publickey for myuser from xx.xx.xx.xx port 44090
> ssh2: RSA SHA256: qhpzQKKbwaX8 Dec 17 11:32:30 myserver sshd[8456]:
> pam_unix(sshd:session): session opened for user myuser by (uid=0) Dec 17
> 11:32:31 myserver sshd[8456]: User child is on pid 8460
> Dec 17 11:32:31 myserver sshd[8460]: Starting session: shell on pts/4 for
> myuser from xx.xx.xx.xx port 44090 id 0
> 
> What are the corresponding events in audit ?

I don't think anyone has ever tried to map between syslog and audit. I also 
think that CIS maybe doesn't understand audit and how it works. For quite 
some time, there has been a requirement to log any key lifecycle in the audit 
logs. This means that the DH key exchange and the session keys get logged 
when they are created and when they are destroyed. Also, pam logs the session 
beginning and end. And sshd logs any keys that it accepts. So, I think the 
information is there if one wanted or needed to map between them. But it 
should be unnecessary. I'm not sure what CIS is looking for in syslog. 
Because if there is something important in syslog that is not in the audit 
logs, I'd like to know what it is.


> My main concern is with the bold line which indicates how the public key
> was granted

That should also be in the audit logs. 

 
> Could you point me to a documentation showing which events a ssh login
> would generate ?

To my knowledge, there is no document that singles out what a sshd login 
should look like. There are documents that explain what the record type are. 
And you should be able to isolate them by ausearch -x sshd.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

