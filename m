Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD10766A893
	for <lists+linux-audit@lfdr.de>; Sat, 14 Jan 2023 03:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673662567;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0ZqEXMgwanbmcUqQ5Bll+x/A9MqsjDAg1juMQNcAcDE=;
	b=Sk5WL5B3zjPOz3djbC7crA5IgbvxIAXXlBIXTbgXtzVsXXv5f2L6srRejIUzgV7Mordhf5
	yYmiVrw5G9hTPm/fpzqhDzy66HiXvVQvFadaFW9itZ8PxdF24+2b5dUJgL7A1CiRKB/2px
	un0SWJMLOQYLi2uX2zM+sZuwlP0ccUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-v6h6QJo6MeCNPPO-aHzy5A-1; Fri, 13 Jan 2023 21:16:03 -0500
X-MC-Unique: v6h6QJo6MeCNPPO-aHzy5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 494DC101A521;
	Sat, 14 Jan 2023 02:16:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB4640C2004;
	Sat, 14 Jan 2023 02:15:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78EBC19459D7;
	Sat, 14 Jan 2023 02:15:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39669194706F for <linux-audit@listman.corp.redhat.com>;
 Sat, 14 Jan 2023 02:15:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17E0A14171B8; Sat, 14 Jan 2023 02:15:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1040014171B7
 for <linux-audit@redhat.com>; Sat, 14 Jan 2023 02:15:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E903785C064
 for <linux-audit@redhat.com>; Sat, 14 Jan 2023 02:15:50 +0000 (UTC)
Received: from icp-osb-irony-out4.external.iinet.net.au
 (icp-osb-irony-out4.external.iinet.net.au [203.59.1.220]) by
 relay.mimecast.com with ESMTP id us-mta-497-TBj_7Tu1MCebxJjBFzGR7g-1; Fri,
 13 Jan 2023 21:15:48 -0500
X-MC-Unique: TBj_7Tu1MCebxJjBFzGR7g-1
IronPort-SDR: g4dG6LsQlduTnBAb/jBjVBCf4K4BwN0E9B/jW0z6pX2gaHS3xLRJjvSCiCIo/o+iA3M3pKeM8G
 AMF8zEhmIf+1kPQu+Q0a8wu8DgbvL9drCb6sI4DL+YiYTJrvIMiIt2UlRz6MeEu0RI8MGH/OC9
 ny8Ex+mHtygrS697DFQVLcMAzI/nmX09LYoo9wKXU57W6yPbYQqhCi4qvjtnuf/gCfnMxfcVPH
 kX9rq/kq8KwvL1TzmJ9lYNfBahnUBnMmiqreKf22P5iNheTnmpRurXVZs5/cPSwSriPTolITfz
 dR0=
X-SMTP-MATCH: 1
IronPort-Data: A9a23:Z9KaOaqZ5znGc2b8l2/qqCUwVLpeBmKkZxIvgKrLsJaIsI4StFCzt
 garIBmBPaqNa2f1L9p0a4vn804HuZLRnYVjT1Ft/C09EngSp5acVYWSI3mrMnLJJKUvbq7HA
 +byyzXkBJppJpMJjk71atANlZT9vE2xbuKU5NTsY0idfic5DnZ+4f5fs7Rh2NUw2IHiW1/lV
 e7a+KUzBnf0g1aYDUpJs8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vIwKPb
 72rIIdVX4/u10xF5tuNyt4Xe2VWGeSKZVDmZnB+A8BOiTAazsA++vpgbqJEMS+7hh3R9+2dx
 umhurSwV0APYrzxid8gSjxdKi9nIPd8/7TudC3XXcy7lyUqclP33OlgSlopIYNe9vdxDWdVs
 /sCJ1jhbDjZ3rPwker9E7kxwJ16c6EHP6tG0p1k5TvEF/BgSJTfQqPFzd5Z2joswMZDAbDXe
 qL1bBI0PUSRO0IUZgh/5JQWmsuknUT/bydjt1PJtZNsynDr8VNxz+24WDbSUpnQLSlPpW67r
 3jL+SLGAxwCLtGUySat8HKxj/fL2y73Reo6MLy+6+4viUCfx3A7EhAaVVKn5/K+jyaDt8l3c
 RVFv3t26PFiqQnyF4a7XgX+qXKNu1gXXN8WGvBSBByx95c4Kj2xXgAsJgOtovR53CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:o3+BpqzW5nqVkzRSs4TvKrPwN71zdoMgy1knxilNoHtuA6+lfq
 GV/MjzuiWftN98YhwdcLO7WZVoI0myyXcd2+B4VotKNzOJhILHFu1fBPDZsl/dJxE=
X-IronPort-AV: E=Sophos;i="5.97,215,1669046400"; 
 d="scan'208,217";a="398907347"
Received: from 219-90-185-117.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
 ([219.90.185.117])
 by icp-osb-irony-out4.iinet.net.au with ESMTP; 14 Jan 2023 10:15:44 +0800
Message-ID: <51db0605c46a61ae4c1923b3710bb8a08febe9f2.camel@iinet.net.au>
Subject: Re: audit rules to help watch for potential threat?
From: Burn Alting <burn.alting@iinet.net.au>
To: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>, 
 "Linux-audit@redhat.com" <Linux-audit@redhat.com>
Date: Sat, 14 Jan 2023 13:15:42 +1100
In-Reply-To: <f50b2b89293f425ea56ec358837dd1eb@jhuapl.edu>
References: <f50b2b89293f425ea56ec358837dd1eb@jhuapl.edu>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Reply-To: burn@swtf.dyndns.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4659134170344463475=="

--===============4659134170344463475==
Content-Type: multipart/alternative; boundary="=-qH8kXuKrZPeIuhUjf0Ej"

--=-qH8kXuKrZPeIuhUjf0Ej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Karen,
Quite simply, just monitor execve (in addition to targeted/mandated monitoring) as
per
# Process execution
-a always,exit -F arch=b64 -S execve -F auid!=unset -F key=cmds

And within /etc/audit/auditd.conf change
    max_log_file = 8    num_logs = 5to    max_log_file = 32    num_logs = 9
Which caters for an expanded set of /var/log/audit/audit.log files (32 x 9 =
288MB).You would need to send your logs to a central SIEM say every 10-15 minutes.
Burn AltingPS. I know I have identified b32 arch but the best b32 arch rule now for
most modern (and supported Linux) is-a always,exit -F arch=b32 -S all -F key=32bit-
abi


On Fri, 2023-01-13 at 22:47 +0000, Wieprecht, Karen M. wrote:
> Steve, Audit team,
> My colleagues and I were discussing ways we might better monitor for  potential
> insider threat.   We can easily see the commands our SAs run when they use sudo in
> front of the command,   but if the  sysadmin uses "sudo su -", then we don't have
> good visibility into the commands they perform while they are su'd unless there
> happens to be an audit rule monitoring the specific files/commands they are
> accessing/running.  
> We've talked about possible way to improve our visibility in this situation, but
> most of the options we came up with are easily thwarted and/or would cause the
> logs to blow up to the point that it's difficult to spot  nefarious
> activity.   Some options we considered included having splunk monitor the shell
> history files, and possibly enabling ps auditing.
> Can you recommend any audit rules that would audit the interactive commands being
> issued by a sysadmin who is su'd as root without causing the logs to blow up?   
> Any assistance you can provide would be much appreciated.
> Thank you,Karen Wieprecht The Johns Hopkins Applied Physics Laboratory--Linux-
> audit mailing listLinux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit
> 

--=-qH8kXuKrZPeIuhUjf0Ej
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Karen,</div><div><br></div><div>Quite simply, just monitor execve =
(in addition to targeted/mandated monitoring) as per</div><div><br></div><d=
iv style=3D"margin-left: 3ch;"><div># Process execution</div><div>-a always=
,exit -F arch=3Db64 -S execve -F auid!=3Dunset -F key=3Dcmds</div><div><br>=
</div></div><div>And within /etc/audit/auditd.conf change</div><div><br></d=
iv><div>&nbsp;&nbsp;&nbsp;&nbsp;max_log_file =3D 8</div><div>&nbsp;&nbsp;&n=
bsp;&nbsp;num_logs =3D 5</div><div>to</div><div>&nbsp;&nbsp;&nbsp;&nbsp;max=
_log_file =3D 32</div><div>&nbsp;&nbsp;&nbsp;&nbsp;num_logs =3D 9</div><div=
><br></div><div>Which caters for an expanded set of /var/log/audit/audit.lo=
g files (32 x 9 =3D 288MB).</div><div>You would need to send your logs to a=
 central SIEM say every 10-15 minutes.</div><div><br></div><div>Burn Alting=
</div><div>PS. I know I have identified b32 arch but the best b32 arch rule=
 now for most modern (and supported Linux) is</div><div style=3D"margin-lef=
t: 3ch;"><div>-a always,exit -F arch=3Db32 -S all -F key=3D32bit-abi</div><=
div></div><div><br></div></div><div></div><div></div><div>On Fri, 2023-01-1=
3 at 22:47 +0000, Wieprecht, Karen M. wrote:</div><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><pre>Steve, Audit team,</pre><pre><br></pre><pre>My colleagues and I were=
 discussing ways we might better monitor for  potential insider threat.   W=
e can easily see the commands our SAs run when they use sudo in front of th=
e command,   but if the  sysadmin uses "sudo su -", then we don't have good=
 visibility into the commands they perform while they are su'd unless there=
 happens to be an audit rule monitoring the specific files/commands they ar=
e accessing/running.  </pre><pre><br></pre><pre>We've talked about possible=
 way to improve our visibility in this situation, but most of the options w=
e came up with are easily thwarted and/or would cause the logs to blow up t=
o the point that it's difficult to spot  nefarious activity.   Some options=
 we considered included having splunk monitor the shell history files, and =
possibly enabling ps auditing.</pre><pre><br></pre><pre>Can you recommend a=
ny audit rules that would audit the interactive commands being issued by a =
sysadmin who is su'd as root without causing the logs to blow up?   </pre><=
pre><br></pre><pre>Any assistance you can provide would be much appreciated=
.</pre><pre><br></pre><pre>Thank you,</pre><pre>Karen Wieprecht </pre><pre>=
The Johns Hopkins Applied Physics Laboratory</pre><pre>--</pre><pre>Linux-a=
udit mailing list</pre><a href=3D"mailto:Linux-audit@redhat.com"><pre>Linux=
-audit@redhat.com</pre></a><pre><br></pre><a href=3D"https://listman.redhat=
.com/mailman/listinfo/linux-audit"><pre>https://listman.redhat.com/mailman/=
listinfo/linux-audit</pre></a><pre><br></pre><pre><br></pre></blockquote></=
body></html>

--=-qH8kXuKrZPeIuhUjf0Ej--

--===============4659134170344463475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4659134170344463475==--

