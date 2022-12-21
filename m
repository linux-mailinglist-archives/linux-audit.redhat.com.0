Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC904652A1C
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 01:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671580958;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kKWVlNESywuUR3vrWYKVbV48yDFlm31UUYtsz7QtpPU=;
	b=IqS6/dMZvEqAYMdGFWrlrCNLtojcIQdHnr/K4L3hgJtxZTtYnfOQlsaDNic6dQ1ZvxayB6
	qGkASWi5L7wp2jhr5PYYdVJOnEUzY/aDY1d4anq6FkE7cV3NojNyPoKpK2PLVUQF/geMjc
	F0VYkjzMH1vLq1kQNfzewNGNOJXKo1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-FvqThosWOeSK9CEXLqgHGg-1; Tue, 20 Dec 2022 19:02:35 -0500
X-MC-Unique: FvqThosWOeSK9CEXLqgHGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F39685C069;
	Wed, 21 Dec 2022 00:02:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C43BC16027;
	Wed, 21 Dec 2022 00:02:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7049C19465B3;
	Wed, 21 Dec 2022 00:02:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9F3719465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 21 Dec 2022 00:02:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 720FA35458; Wed, 21 Dec 2022 00:02:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6984C175AD
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 00:02:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F0BF3C025B2
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 00:02:25 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
 (icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
 relay.mimecast.com with ESMTP id us-mta-221-b758O-rCMAiXmvvHQeAnkw-1; Tue,
 20 Dec 2022 19:02:22 -0500
X-MC-Unique: b758O-rCMAiXmvvHQeAnkw-1
IronPort-SDR: OwJZOU4zBF5AR4FCQxkdYOEmN+UdJnjGESEFemiQfE1eTfO2HtYb8bXQvxUR8oGUYfUTeJV3wI
 zhs8BZ2omV3lTKQQ1hY4vo+7KHvD/pim6mY10evHgGE5hojrkYRTKe/vtaV+5lehs6f91Pw5Ae
 D07ejfQ867BKy9BO9O9JjOdYMe1KUG7vsOn75bb7hGL9Bo3lKwsO5KxH9zom5Coy9OTqe48Z/K
 +HC9t7EFbPZxpMb1PzjnHe6ISfSYdVDK3jkQ8tV7v0SE8qzqtyuewXXc54RSZHHqdInJx1THKu
 Nxc=
X-SMTP-MATCH: 1
IronPort-Data: A9a23:N3NTJqOmP8ZjKejvrR0llcFynXyQoLVcMsEvi/4bfWQNrUoSY0+zN
 tZk7ZAyRo+IZ1JB9ql3aI2GQSqzYKdhr6ZjeLYO3SgFo0li9IyUW7x1Em+qZ3nId5eZFBo8h
 ykjQoKowP4cHye0SiiFb+CJQUlUjclkkZKlVYYokggoLeNVYH9JZSBLwobVsaYx6TSNOD5hj
 PupyyHp1P5J7BYvWo4cw/rrRBpH4K+o4GtA1rA0TagjUFT2zxH5ALpDfvvpdyOQroR8RoaHq
 +j/IL6R2X7D5jEJNpCclej7aRZTXJrZMBmJlS8DM0SiqkAqSi0aybknOrwHdltZzTmYmdx30
 5NKr5PYpQUBZPSd3rVFFUAITmcnZPIuFLzveBBTteSZ0lfANXLo3/RoA2k3PIsV5qBxDH0I/
 OFwxDUlMkzd1rztn+7iIgVqrsctNtnlErk7hjZ5ywzVI9ssTpr+TIyfsLe02x913KiiB832f
 MUDdDBlRA7Nbx1GJhEcD5dWtOOpgGTvNjRFpFOJjbA672ja0Ep6172FDTbOUobTFIAExgPB9
 j+Dpj2mRBACctWTwD/D+XWpwObS9c/mZL8v+HSD3qYCqDWuKqY7VkR+uYeTyRVhtnODZg==
IronPort-HdrOrdr: A9a23:uHddM6rKXghJrwpVp/Yy4K8aV5oHeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90cq7MBHhHPxOgbX5VI3KNDUO3lHHEGgI1/qA/9SPIUzDH9lmpM
 NdmvhFY+EY1WIK9voSOjPIaurIHeP3l5xAWd2ut0uFkzsaEZ2JgG9Ce2CmLnE=
X-IronPort-AV: E=Sophos;i="5.96,259,1665417600"; 
 d="scan'208,217";a="446963741"
Received: from 219-90-185-117.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
 ([219.90.185.117])
 by icp-osb-irony-out8.iinet.net.au with ESMTP; 21 Dec 2022 08:01:59 +0800
Message-ID: <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
Subject: Re: BPF audit logs
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, Linux-Audit Mailing List
 <linux-audit@redhat.com>
Date: Wed, 21 Dec 2022 11:01:57 +1100
In-Reply-To: <5652312.DvuYhMxLoT@x2>
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
 <5652312.DvuYhMxLoT@x2>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5942167705984263349=="

--===============5942167705984263349==
Content-Type: multipart/alternative; boundary="=-p3oiZLLLSDqBx5lOjjiJ"

--=-p3oiZLLLSDqBx5lOjjiJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2022-12-20 at 18:16 -0500, Steve Grubb wrote:
> Hello Burn,
> 
> On Tuesday, December 20, 2022 5:36:28 PM EST Burn Alting wrote:
> > I note that the unsolicited AUDIT_BPF audit event only provides a program
> > id and operation (load or unload). For example, 	type=BPF
> > msg=audit(21/12/22 09:03:35.765:439) : prog-id=75 op=LOAD or	type=BPF
> > msg=audit(21/12/22 09:04:05.883:460) : prog-id=0 op=UNLOAD
> > I also note that the bpf auxillary structure (struct bpf_prog_aux) that
> > holds the program id value, also holds a name (struct bpf_prog_aux->name)
> > and uid  (struct bpf_prog_aud->user_struct->uid). Perhaps adding these two
> > items to the AUDIT_BPF event would provide more security context for this
> > unsolicited event. Thoughts?
> 
> I agree that the resulting event leaves a lot to be desired. When the patch 
> was being merged, I think it was pointed out that all we have is a number. 
> The BPF folks seemed to insist that was all that was needed. They never 
> explained how to use that number for anything practical like knowing what was 
> loaded. If anything can be done to improve the situation, I'd like to 
> encourage a patch. Systemd triggers a bunch of these events. But what it's 
> doing is unknowable.
> 
> -Steve

And to cap this off, the program id will always be zero on an UNLOAD, as
the routine that sets it to zero, kernel/bpf/syscall.c:bpf_prog_free_id(),
is called before the emit audit event routine, kernel/bpf/syscall.c:bpf_audit_prog().

So a bug!

Rgds

--=-p3oiZLLLSDqBx5lOjjiJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Tue, 2022-12-20 at 18:16 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>Hello Burn,</pre><pre><br></pre><pre>On Tuesday, D=
ecember 20, 2022 5:36:28 PM EST Burn Alting wrote:</pre><blockquote type=3D=
"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-le=
ft:1ex"><pre>I note that the unsolicited AUDIT_BPF audit event only provide=
s a program</pre><pre>id and operation (load or unload). For example, =09ty=
pe=3DBPF</pre><pre>msg=3Daudit(21/12/22 09:03:35.765:439) : prog-id=3D75 op=
=3DLOAD or=09type=3DBPF</pre><pre>msg=3Daudit(21/12/22 09:04:05.883:460) : =
prog-id=3D0 op=3DUNLOAD</pre><pre>I also note that the bpf auxillary struct=
ure (struct bpf_prog_aux) that</pre><pre>holds the program id value, also h=
olds a name (struct bpf_prog_aux-&gt;name)</pre><pre>and uid  (struct bpf_p=
rog_aud-&gt;user_struct-&gt;uid). Perhaps adding these two</pre><pre>items =
to the AUDIT_BPF event would provide more security context for this</pre><p=
re>unsolicited event. Thoughts?</pre></blockquote><pre><br></pre><pre>I agr=
ee that the resulting event leaves a lot to be desired. When the patch </pr=
e><pre>was being merged, I think it was pointed out that all we have is a n=
umber. </pre><pre>The BPF folks seemed to insist that was all that was need=
ed. They never </pre><pre>explained how to use that number for anything pra=
ctical like knowing what was </pre><pre>loaded. If anything can be done to =
improve the situation, I'd like to </pre><pre>encourage a patch. Systemd tr=
iggers a bunch of these events. But what it's </pre><pre>doing is unknowabl=
e.</pre><pre><br></pre><pre>-Steve</pre></blockquote><pre><br></pre><pre>An=
d to cap this off, the program id will always be zero on an UNLOAD, as</pre=
><pre>the routine that sets it to zero, kernel/bpf/syscall.c:bpf_prog_free_=
id(),</pre><pre>is called before the emit audit event routine, kernel/bpf/s=
yscall.c:bpf_audit_prog().</pre><pre><br></pre><pre>So a bug!</pre><pre>
Rgds</pre></body></html>

--=-p3oiZLLLSDqBx5lOjjiJ--

--===============5942167705984263349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============5942167705984263349==--

