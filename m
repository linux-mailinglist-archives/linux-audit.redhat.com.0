Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3E1F31F218
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 23:08:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-NEdfjQooPcyqmHguoOYcXA-1; Thu, 18 Feb 2021 17:08:30 -0500
X-MC-Unique: NEdfjQooPcyqmHguoOYcXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 394AB801975;
	Thu, 18 Feb 2021 22:08:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4C05D9C2;
	Thu, 18 Feb 2021 22:08:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C000418095CB;
	Thu, 18 Feb 2021 22:08:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IM81cV016194 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 17:08:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 049C5200AC37; Thu, 18 Feb 2021 22:08:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F32852166B2D
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 22:07:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A0F186E121
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 22:07:58 +0000 (UTC)
Received: from sonic317-39.consmr.mail.ne1.yahoo.com
	(sonic317-39.consmr.mail.ne1.yahoo.com [66.163.184.50]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-574-CIzHDcoOMA6u5ftV_b8QCA-1;
	Thu, 18 Feb 2021 17:07:56 -0500
X-MC-Unique: CIzHDcoOMA6u5ftV_b8QCA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1613686076; bh=WDwI5tSb125ElCjCdSUexQ+FLc0/MLmDEKkkXk7dCcY=;
	h=X-Sonic-MF:From:Subject:To:Date:From:Subject;
	b=W5L/OAil1ZuzUIAO4nTU0MqC8EvTtG56euC+9coSkZccgU28Zwb3XxXUAh0jajDaKv1wzp6yAw3iHuCHNGkkELX/jwqIBylaXsDCJzYHe6bdFg1VEiDK1p5DvcM2Lyqix7X+06jSc6CtZkXVUUJEsjzQZ18lodxu2Ef5YQNKwaBfkN9iClBveIqF8hwTQ7LuI9ifTSZ0Yd2RCkp9ltcoFDx3EMTJp6RKnZJF7p5xo25B+T5xWR4tDyhfdiyptnWrmLZ8NQIqEuxXmi1Hi8VIjgzo+gOQYMBq+2WwX4yf5duMHX4uiNDWR5nhkDZet0uJNpu9zC613MWes6dGtNmJ6Q==
X-YMail-OSG: DLQTCFEVM1nDCkvRdXBLT7_yLNmaPUQ1yAhUsyZh1RPdvzbvZ2l32Wf80TqAI0z
	HNsu6gGfvYapBqfWzPxDIB.hxp.HZXiUI.V1ca_D8fPKE1P1WScvJaH5AKys_GAAlE9zmLWNrIxc
	Le5T8uLQaClF6P0_9UqF.dnrV1kj0y6NzJycRFHdsYzGH9zGjHf0fTMFsRUVN_CnrVRvNKyWudaJ
	H58owMuEGd_.diKtwzhHLwWg4Bphsns.vVb02mpqVbZrgSEyjI_.7hK8AGLEb2y0TzyAAuoN2804
	zJnKMUmYOiqr.M6198hf71Qd07lCFYJt9z.nf5dZPKhltCUi_okRDj_tY1BYupuIjEV3n.nI5VDn
	jBkDr5FlbYQuofkutNM8MmaejqwbLs7LPbomA.Z23RIfyow7eKlFn1j6yTzKEBlP.0qsiuBpkLKl
	qbTIT6K49tJkjP5ypWtFFU4nJ8HSFl7BAl6z0864rjzda.bbDgz_nwVJTzPaQmnF0im6oLj5jhkw
	8qiApBSRY5esiDC_ZCzOQIpfYkfL13RU_hq2qmjd1lcjLJNwVjNgMQKhPujv0k_esNJndZwNsr4H
	SKNRPE4ZjeN6oXP0q3teH_t8dqFZH2BVITrcBNoO8ng1GBQxaEGRczQdzFxQwFO_ZoooE9hMl6Vw
	buxLSOsjBhnKCuK4lwXsDoEXhgpUmn5Yj0qo8by7nAiBEvWlptVjv5YRa1sRdd24qMwDxPZGJh0x
	OjXrAmdu8d.sId5S3dMcG0aAqCCDrMxAHBqPHtq98FEciUvUF0AiEv2x0ZAWCtUMj5Zunai6NMK8
	u6uMrwdQsdZLLRc1eWNMh0eVzMxtOLswFgk1MBLXqR4LbGdZQIf21J7X0S04lQ67y2_A_Bq2QQYb
	GZztWiePTYlQnBgE5P7lEjEYGpTEb8EuOFaCmo7EH3.FR7W65EtSwj2j7grU0WkgbYK9E9wyepOV
	QX05z.EYfToqAHFrmzqLNN0u68Lk2ElAx_925LNTVzL3VBoYXktMqyvkB8pRaFr8vxU4YlSE7JTl
	0Yhu2tpTw1D7A4G4GruTPGk6gem8OfPwCA6JSnPvhW1EvRZvdJ8vWN8pEr2HjB0mzqW43BjOVzOS
	KmUkCtVoI7WWrb65vCeoGk54Z2kWiqrxsaqm5ITmE1Ukhsed82.9CiUCfDJrx7P6Yf4DqTqgmge5
	D_nIR9LhSMXoSahi9T7u2Ovk_GVePoMMUBMiiSToOTZMCWNiMTxnutgBWp1xX49Jqpn0zZiIVB7u
	IPqTom9W_Dh4.gpjSe6r8mr1.SvpBgn15OhMFKEvey7lZUB17ilET8foyHX2UTwG4JHinRtlHvVQ
	kTmHuRq7s7Q2wHCup_3KWD3K7pMWXMZ0P7EUFKAMn5jfK_VgmxlfHnsQXQ.Xo.zzb4uF_hueO55A
	p4TUGLyW6e_QXx7g_uyR1vx5cvHPubc0sq9vx90W6mM71jlsQRFTWJcYQZmg9kAgINUuQa6Af4Jf
	ZSHiPr.n3OYygpMnh33FTwFppjlaU9O_F9.Dad50HVe3mabEkJcrW6rE4WedqlTG.VEMAZhf4Llb
	dLYK4B6O8wQSBYMQwJiTkmCcVycU5GCcrx2kdCXanoLM2pmmluit5vzXZX4Kl3BipPMmsvYf9SIo
	AQaqU7WRs04bXpliTzZ9BUH_upjbGNgGaT8wfUA3vFGmjG_3PiJizb2Nmp5aB2X53nNU2f.qXNn.
	h_T4.T2FeTRGQptzV1agsfNbbNtxdXvkIjevimDnQdHZjDmAMDx8Y2DQfP0KNQviHYRqonQh6IV8
	8surF7TK2NLudY7sIqy40N0DiwI6_ORECULX_VIVajOFhmSMUJzZOBnIsunZXHcsfAE5Q.zUMsKq
	g0WLomelogk2_RT5Q7veK3zDhfFlsGyjmfNYg1lPn97XiugFeJxyjTYGVzqL2Jc5P0_KL4TpSbVa
	agnfKUJ1ofWujcJ5bosxC5rjmwL5kzQ3bHeO5e9bQv5vEcL6lTXns0j8O.tPu009LV8e6W7MFdEU
	p4.LGofGLLcSE1gASeIWQj6uSZinGkmYFBFUo1O6Lhv83fp0wXtzb6a5iznmQhGD1LJGc29.4sE0
	cnwWE26MGGPu5IfU8273lfEPjTPrPLRrQtZugL55UmZhUYB2qh7C5hDA5jU1LvukiRUW77jn1kf_
	40emat9M_okifu3mVxSVyuAFitarQ.Z1FtL4eDQyyO.c.i1GTUT08c5GnVUTapkxasV388ZQuK0o
	7tHiu4SAlbYhH.Wu.FfPdZPvKz_rP2x5zTol.uUFviXhOrfEj2D1mPvJI_Qu2j8N8dOYB63NJCPq
	6JDNdE3DFzwl1IYLZGjHjjZJwzC5Srrsz.d4S1WfowpTUitCRLmWH1TG2yyDr3PbMoWRBNqIbx9p
	xXO7uYpGbuh0S.1ZUwrwAVsMFPpy1UaTtmfDd7V6CVwpBiKVJeR2hJMbyN3suX4kT4HUVeDjgUQ_
	YnyAf6CellcwX_rNXC30SFZwOD1FVrwU.l6.hOUS7XKI_nlVA7xD4ddblHpw0geIPugrEbO1RZwt
	U2wtbM19qBK3JQE9ViAPd3FgU7ORM93JJWEe1V.PLp8d950wAjPeQPPXb9TSxqSav4G7Eg.kVbAU
	25HjciPP2dNaFZiCfIuMymbnpvTZB7hfkYjLRk_k-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 18 Feb 2021 22:07:56 +0000
Received: by smtp415.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID f7e0207a78745023d33a85dae7ffc620; 
	Thu, 18 Feb 2021 22:07:54 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: security_task_getsecid() and subjective vs objective task creds
To: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-audit@redhat.com
References: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
Message-ID: <5f8a424a-2aab-f11a-0e06-f8f075c644f6@schaufler-ca.com>
Date: Thu, 18 Feb 2021 14:07:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/18/2021 11:34 AM, Paul Moore wrote:
> Hi all,
>
> When looking into a problem I noticed that audit was recording the
> wrong subject label for a process.  Doing a bit of digging I realized
> this was caused by the SELinux security_task_getsecid() implementation
> returning the objective security label (taken from task->real_cred),
> and not the subjective security label (taken from task->cred).
>
> Looking around at the other LSMs which implement this hook, Smack and
> AppArmor, it appears they both do the same thing: return the objective
> security ID for the process.  Looking quickly at the various non-LSM
> callers of the security_task_getsecid() hook, it unfortunately looks
> like all of them expect the subjective security ID to be returned.
> The only caller I'm not 100% confident in is binder, but from what I
> can tell it looks like they are expecting the subjective ID too.
>
> At least we are consistently wrong :)

We may have come down with a case of helperitis. 

> How do we want to fix this?  The obvious fix is to change the SELinux,
> AppArmor, and Smack security_task_getsecid() implementations to return
> the subjective security ID (->cred), and likely make a note in
> lsm_hooks.h,

That would be my choice.

>  but if someone can see a case where we would need both
> the subjective and objective security labels speak up and we can
> introduce a new hook for the subjective label, and likely add a "_obj"
> to the end of the existing hook to help make it more clear.  If
> neither of those options are acceptable, we could convert all of the
> existing callers to use something like the line below (assumes
> current), but that is the least appealing option as far as I'm
> concerned.
>
>   security_cred_getsecid(current_cred(), &sid);
>
> Opinions?

If the objective cred isn't being used in the access control decision
it seems pointless to add it to the audit record. If there is a case
where the task is being treated as an object, signal delivery comes to
mind, you still want the objective credential. So it seems like care
may be required to ensure that the correct value (sub vs obj) is
used.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

